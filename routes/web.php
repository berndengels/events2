<?php

use App\Models\Theme;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EventController as PublicEventController;
use App\Http\Controllers\PageController as PublicPageController;
use App\Http\Controllers\StaticPageController as PublicStaticPageController;
use App\Http\Controllers\ContactController as PublicContactController;
use App\Http\Controllers\Admin\EventController as AdminEventController;
use App\Http\Controllers\Admin\FileController as AdminFileController;
use App\Http\Controllers\Admin\EventTemplateController AS AdminEventTemplateController;
use App\Http\Controllers\Admin\EventPeriodicController as AdminEventPeriodicController;
use App\Http\Controllers\Admin\MusicStyleController as AdminMusicStyleController;
use App\Http\Controllers\Admin\UserController as AdminUserController;
use App\Http\Controllers\Admin\CategoryController as AdminCategoryController;
use App\Http\Controllers\Admin\ThemeController as AdminThemeController;
use App\Http\Controllers\Admin\PageController as AdminPageController;
use App\Http\Controllers\Admin\MenuController as AdminMenuController;
use App\Http\Controllers\Admin\AddressController as AdminAddressController;
use App\Http\Controllers\Admin\AddressCategoryController as AdminAddressCategoryController;
use App\Http\Controllers\Admin\NewsletterController as AdminNewsletterController;
use App\Http\Controllers\Admin\MessageController as AdminMessageController;
use App\Http\Controllers\Admin\ServiceController as AdminServiceController;
use App\Http\Controllers\Admin\CacheController as AdminCacheController;

Auth::routes();
Auth::routes(['register' => false]);
Route::get('/logout', function() {
	Auth::logout();
	session()->invalidate();

	return redirect()->route('public.events');
});

Route::permanentRedirect('/events', '/');
Route::permanentRedirect('/intern', '/admin/events');
Route::permanentRedirect('/admin', '/admin/events');

$staticPages = collect([]);
$pathStaticPages = collect(config('view.paths'))->map(function($path) use (&$staticPages) {
	$path = $path . '/public/static';
	if(is_dir($path)) {
		foreach(scandir($path) as $item) {
			if(false !== strrpos($item, '.blade.php')) {
				$staticPages = $staticPages->merge(basename($item,'.blade.php'));
			}
		}
	}
});
if($staticPages->count() > 0)  {
	$staticPages->each(function($slug){
		Route::middleware('web')->get("/static/{slug?}", [PublicStaticPageController::class, 'get'])->name("public.static.$slug");
	});
}

Route::group(['middleware' => 'web'], function () {
	Route::get('/feed', [PublicEventController::class, 'feed'])->name('public.feed');
	Route::get('/ical', [PublicEventController::class, 'ical'])->name('public.ical');
	Route::get('/', [PublicEventController::class, 'getActualMergedEvents'])->name('public.events');
	Route::get('show/{date}', [PublicEventController::class, 'show'])->name('public.event.eventsShow');
	Route::get('calendar/{year}/{month}', [PublicEventController::class, 'calendar'])->name('public.eventCalendar');
//	Route::get('calendar', [PublicEventController::class, 'calendar'])->name('public.eventCalendar');
});

$categories = Category::whereIsPublished(true)->get();
foreach($categories as $item) {
	Route::middleware('web')->get('/events/category/'.$item->slug, [PublicEventController::class, 'getActualMergedEventsByCategory'])->name('public.eventsByCategory.' . $item->slug);
}
$themes = Theme::where('is_published', 1)->get();
foreach($themes as $item) {
	Route::middleware('web')->get('/theme/'.$item->slug, [PublicEventController::class, 'getActualMergedEventsByTheme'])->name('public.eventsByTheme.'. $item->slug);
}

//Route::get('/category/{slug}', [PublicEventController::class,'getActualMergedEventsByCategory'])->name('public.eventsByCategory');
//Route::get('/theme/{slug}', [PublicEventController::class,'getActualMergedEventsByTheme'])->name('public.eventsByTheme');
Route::get('/page/{slug}', [PublicPageController::class, 'get'])->name('public.page');

Route::prefix('contact')->group(function () {
	Route::get('/formBands', [PublicContactController::class, 'formBands'])->name('public.formBands');
	Route::post('/sendBands', [PublicContactController::class, 'sendBands'])->name('public.sendBands');
//    Route::get('/formNewsletter', 'ContactController@formNewsletter')->name('public.newsletterForm');
	//	  Route::post('/sendNewsletter', 'ContactController@sendNewsletter')->name('action.sendNewsletter');
	Route::get('/formNewsletter', [PublicContactController::class, 'formNewsletterSubscribe'])->name('public.formNewsletterSubscribe');
	Route::post('/sendNewsletter', [PublicContactController::class, 'sendNewsletterSubscribe'])->name('public.sendNewsletterSubscribe');
});

Route::group([
	'prefix'     => 'contact',
	'as'         => 'public.',
	'middleware' => 'web'
], function () {
	Route::resource('message', 'BandMessageController')->only(['create','store']);
	Route::resource('newsletter', 'NewsletterController')->only(['create','store']);
});

// admin sites
Route::group([
	'prefix'	=> 'admin',
	'as'	=> 'admin.',
	'middleware'	=> ['auth'],
], function () {
    Route::post('/file/upload', [AdminFileController::class, 'upload'])->name('fileUpload');
	Route::post('/file/uploadAudio', [AdminFileController::class, 'uploadAudio'])->name('fileUploadAudio');
    Route::post('/file/editorUpload', [AdminFileController::class, 'editorUpload'])->name('fileEditorUpload');
    Route::post('/file/uploadCropped', [AdminFileController::class, 'uploadCropped'])->name('fileUploadCropped');
    Route::post('/file/delete', [AdminFileController::class, 'delete'])->name('fileDelete');
    Route::post('/file/deleteDropfile', [AdminFileController::class, 'deleteDropfile'])->name('dropfileDelete');
    Route::get('/file/syncImages', [AdminFileController::class, 'dispatchSync'])->name('syncImages');

    Route::get('/events', [AdminEventController::class, 'listEvents'])->name('eventList');
	Route::get('/events/archive', [AdminEventController::class, 'archive'])->name('eventArchive');
	Route::get('/events/archive/search', [AdminEventController::class, 'archive'])->name('eventArchiveSearch');
    Route::get('/events/edit', [AdminEventController::class, 'edit'])->name('eventNew');
    Route::get('/events/edit/{id?}', [AdminEventController::class, 'edit'])->name('eventEdit');
    Route::get('/events/delete/{id}', [AdminEventController::class, 'delete'])->name('eventDelete');
	Route::post('/events/template', [AdminEventController::class, 'template'])->name('eventTemplateSelect');
	Route::post('/events/store/{id?}', [AdminEventController::class, 'store'])->name('eventStore');
	Route::post('/events/override/{id?}', [AdminEventController::class, 'override'])->name('eventOverride');
    Route::post('/events/checkForPeriodicDate', [AdminEventController::class, 'checkForPeriodicDate'])->name('checkForPeriodicDate');

	Route::get('/eventsTemplate', [AdminEventTemplateController::class,'index'])->name('eventTemplateList');
	Route::get('/eventsTemplate/edit', [AdminEventTemplateController::class,'edit'])->name('eventTemplateNew');
	Route::get('/eventsTemplate/edit/{id?}', [AdminEventTemplateController::class,'edit'])->name('eventTemplateEdit');
	Route::get('/eventsTemplate/delete/{id}', [AdminEventTemplateController::class,'delete'])->name('eventTemplateDelete');
	Route::post('/eventsTemplate/store/{id?}', [AdminEventTemplateController::class,'store'])->name('eventTemplateStore');

	Route::get('/eventsPeriodic', [AdminEventPeriodicController::class,'index'])->name('eventPeriodicList');
    Route::get('/eventsPeriodic/edit', [AdminEventPeriodicController::class,'edit'])->name('eventPeriodicNew');
    Route::get('/eventsPeriodic/edit/{id?}', [AdminEventPeriodicController::class,'edit'])->name('eventPeriodicEdit');
    Route::get('/eventsPeriodic/delete/{id}', [AdminEventPeriodicController::class,'delete'])->name('eventPeriodicDelete');
    Route::post('/eventsPeriodic/store/{id?}', [AdminEventPeriodicController::class,'store'])->name('eventPeriodicStore');

    Route::get('/users', [AdminUserController::class, 'index'])->name('adminUserList');
    Route::get('/users/edit', [AdminUserController::class, 'edit'])->name('adminUserNew');
    Route::get('/users/edit/{id?}', [AdminUserController::class, 'edit'])->name('adminUserEdit');
    Route::get('/users/delete/{id}', [AdminUserController::class, 'delete'])->name('adminUserDelete');
    Route::post('/users/store/{id?}', [AdminUserController::class, 'store'])->name('adminUserStore');
	Route::get('/users/reset', [AdminUserController::class, 'reset'])->name('adminUserReset');

    Route::get('/categories', [AdminCategoryController::class,'index'])->name('categoryList');
    Route::get('/categories/edit', [AdminCategoryController::class,'edit'])->name('categoryNew');
    Route::get('/categories/edit/{id?}', [AdminCategoryController::class,'edit'])->name('categoryEdit');
    Route::get('/categories/delete/{id}', [AdminCategoryController::class,'delete'])->name('categoryDelete');
    Route::post('/categories/store/{id?}', [AdminCategoryController::class,'store'])->name('categoryStore');

    Route::get('/themes', [AdminThemeController::class, 'index'])->name('themeList');
    Route::get('/themes/edit', [AdminThemeController::class, 'edit'])->name('themeNew');
    Route::get('/themes/edit/{id?}', [AdminThemeController::class, 'edit'])->name('themeEdit');
    Route::get('/themes/delete/{id}', [AdminThemeController::class, 'delete'])->name('themeDelete');
    Route::post('/themes/store/{id?}', [AdminThemeController::class, 'store'])->name('themeStore');

    Route::get('/pages', [AdminPageController::class, 'index'])->name('pageList');
    Route::get('/pages/edit', [AdminPageController::class, 'edit'])->name('pageNew');
    Route::get('/pages/edit/{id?}', [AdminPageController::class, 'edit'])->name('pageEdit');
    Route::get('/pages/delete/{id}', [AdminPageController::class, 'delete'])->name('pageDelete');
    Route::post('/pages/store/{id?}', [AdminPageController::class, 'store'])->name('pageStore');

	Route::get('/musicStyles', [AdminMusicStyleController::class,'index'])->name('musicStyleList');
	Route::get('/musicStyles/edit', [AdminMusicStyleController::class,'edit'])->name('musicStyleNew');
	Route::get('/musicStyles/edit/{id?}', [AdminMusicStyleController::class,'edit'])->name('musicStyleEdit');
	Route::get('/musicStyles/delete/{id}', [AdminMusicStyleController::class,'delete'])->name('musicStyleDelete');
	Route::post('/musicStyles/store/{id?}', [AdminMusicStyleController::class,'store'])->name('musicStyleStore');

	Route::get('/addresses', [AdminAddressController::class, 'listAll'])->name('addressList');
	Route::get('/addresses/show/{id}', [AdminAddressController::class, 'show'])->name('addressShow');
	Route::get('/addresses/edit', [AdminAddressController::class, 'edit'])->name('addressNew');
	Route::get('/addresses/edit/{id?}', [AdminAddressController::class, 'edit'])->name('addressEdit');
	Route::get('/addresses/delete/{id}', [AdminAddressController::class, 'delete'])->name('addressDelete');
	Route::post('/addresses/store/{id?}', [AdminAddressController::class, 'store'])->name('addressStore');

	Route::get('/addressCategories', [AdminAddressCategoryController::class, 'index'])->name('addressCategoryList');
	Route::get('/addressCategories/edit', [AdminAddressCategoryController::class, 'edit'])->name('addressCategoryNew');
	Route::get('/addressCategories/edit/{id?}', [AdminAddressCategoryController::class, 'edit'])->name('addressCategoryEdit');
	Route::get('/addressCategories/delete/{id}', [AdminAddressCategoryController::class, 'delete'])->name('addressCategoryDelete');
	Route::post('/addressCategories/store/{id?}', [AdminAddressCategoryController::class, 'store'])->name('addressCategoryStore');

	Route::get('/newsletter', [AdminNewsletterController::class, 'index'])->name('newsletterList');
	Route::get('/newsletter/edit/{campaignId?}', [AdminNewsletterController::class, 'edit'])->name('newsletterEdit');
	Route::get('/newsletter/delete/{campaignId}', [AdminNewsletterController::class, 'delete'])->name('newsletterDelete');
	Route::post('/newsletter/process', [AdminNewsletterController::class, 'process'])->name('newsletterProcess');
	Route::post('/newsletter/preview', [AdminNewsletterController::class, 'preview'])->name('newsletterPreview');
	Route::post('/newsletter/create', [AdminNewsletterController::class, 'create'])->name('newsletterCreate');
	Route::post('/newsletter/check', [AdminNewsletterController::class, 'check'])->name('newsletterCheck');
	Route::post('/newsletter/test', [AdminNewsletterController::class, 'test'])->name('newsletterTest');
	Route::post('/newsletter/send', [AdminNewsletterController::class, 'send'])->name('newsletterSend');
	Route::get('/newsletter/members/{segmentId}', [AdminNewsletterController::class, 'getMembers'])->name('newsletterMembers');

	Route::get('/messages', [AdminMessageController::class, 'getList'])->name('messageList');
	Route::get('/messages/show/{id}', [AdminMessageController::class, 'show'])->name('messageShow');
	Route::get('/messages/edit', [AdminMessageController::class, 'edit'])->name('messageNew');
	Route::get('/messages/edit/{id?}', [AdminMessageController::class, 'edit'])->name('messageEdit');
	Route::get('/messages/delete/{id}', [AdminMessageController::class, 'delete'])->name('messageDelete');
	Route::post('/messages/store/{id?}', [AdminMessageController::class, 'store'])->name('messageStore');

    Route::get('/services/dumpdb', [AdminServiceController::class, 'dumpDb'])->name('service.dumpDb');
	Route::get('/services/syncImages', [AdminServiceController::class, 'syncImages'])->name('service.syncImages');
	Route::get('/services/makeThumbs', [AdminServiceController::class, 'makeThumbs'])->name('service.makeThumbs');
    Route::get('/services/sanitizeImageDB', [AdminServiceController::class, 'sanitizeImageDB'])->name('service.sanitizeImageDB');
    Route::get('/services/cropImages', [AdminServiceController::class, 'cropImages'])->name('service.cropImages');
	Route::get('/services/browserTestReport', [AdminServiceController::class, 'browserTestReport'])->name('service.browserTestReport');
	Route::get('/services/phpinfo',[AdminServiceController::class, 'phpinfo'])->name('service.phpinfo');
	Route::get('/cache/flush', [AdminCacheController::class, 'flush'])->name('service.cacheFlush');
	Route::get('/cache/clear', [AdminCacheController::class, 'clear'])->name('service.cacheClear');
    Route::get('/cache/forget/{key}', [AdminCacheController::class, 'forget'])->name('service.cacheForget');
	Route::group([
		'prefix' => 'menus',
	], function () {
		Route::get('show', [AdminMenuController::class, 'show'])->name('menuShow');
		Route::post('operation/{operation}', [AdminMenuController::class, 'operation'])->name('menuOperation');
		Route::post('store', [AdminMenuController::class, 'store'])->name('menuStore');
		Route::get('icons', [AdminMenuController::class, 'icons'])->name('menuIcons');
	});
});

Route::fallback(fn() => redirect()->route('public.events'));
?>