<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EventController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\StaticPageController;

Auth::routes();

Route::permanentRedirect('/intern', '/admin/events');
Route::permanentRedirect('/events', '/');

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])
    ->group(static function () {
        Route::prefix('admin')
            ->namespace('App\Http\Controllers\Admin')
            ->name('admin/')
            ->group(static function () {
                Route::prefix('admin-users')->name('admin-users/')->group(static function () {
                    Route::get('/', 'AdminUsersController@index')->name('index');
                    Route::get('/create', 'AdminUsersController@create')->name('create');
                    Route::post('/', 'AdminUsersController@store')->name('store');
                    Route::get('/{adminUser}/impersonal-login', 'AdminUsersController@impersonalLogin')->name('impersonal-login');
                    Route::get('/{adminUser}/edit', 'AdminUsersController@edit')->name('edit');
                    Route::post('/{adminUser}', 'AdminUsersController@update')->name('update');
                    Route::delete('/{adminUser}', 'AdminUsersController@destroy')->name('destroy');
                    Route::get('/{adminUser}/resend-activation', 'AdminUsersController@resendActivationEmail')->name('resendActivationEmail');
                });
            });
    });

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])
    ->group(static function () {
        Route::prefix('admin')
            ->namespace('App\Http\Controllers\Admin')
            ->name('admin/')
            ->group(static function () {
                Route::get('/profile', 'ProfileController@editProfile')->name('edit-profile');
                Route::post('/profile', 'ProfileController@updateProfile')->name('update-profile');
                Route::get('/password', 'ProfileController@editPassword')->name('edit-password');
                Route::post('/password', 'ProfileController@updatePassword')->name('update-password');
            });
    });

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('categories')->name('categories/')->group(static function () {
            Route::get('/', 'CategoryController@index')->name('index');
            Route::get('/create', 'CategoryController@create')->name('create');
            Route::post('/', 'CategoryController@store')->name('store');
            Route::get('/{category}/edit', 'CategoryController@edit')->name('edit');
            Route::post('/bulk-destroy', 'CategoryController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{category}', 'CategoryController@update')->name('update');
            Route::delete('/{category}', 'CategoryController@destroy')->name('destroy');
            Route::get('/export', 'CategoryController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('themes')->name('themes/')->group(static function () {
            Route::get('/', 'ThemeController@index')->name('index');
            Route::get('/create', 'ThemeController@create')->name('create');
            Route::post('/', 'ThemeController@store')->name('store');
            Route::get('/{theme}/edit', 'ThemeController@edit')->name('edit');
            Route::post('/bulk-destroy', 'ThemeController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{theme}', 'ThemeController@update')->name('update');
            Route::delete('/{theme}', 'ThemeController@destroy')->name('destroy');
            Route::get('/export', 'ThemeController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('event-templates')->name('event-templates/')->group(static function () {
            Route::get('/', 'EventTemplateController@index')->name('index');
            Route::get('/create', 'EventTemplateController@create')->name('create');
            Route::post('/', 'EventTemplateController@store')->name('store');
            Route::get('/{eventTemplate}/edit', 'EventTemplateController@edit')->name('edit');
            Route::post('/bulk-destroy', 'EventTemplateController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{eventTemplate}', 'EventTemplateController@update')->name('update');
            Route::delete('/{eventTemplate}', 'EventTemplateController@destroy')->name('destroy');
            Route::get('/export', 'EventTemplateController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('event-periodics')->name('event-periodics/')->group(static function () {
            Route::get('/', 'EventPeriodicController@index')->name('index');
            Route::get('/create', 'EventPeriodicController@create')->name('create');
            Route::post('/', 'EventPeriodicController@store')->name('store');
            Route::get('/{eventPeriodic}/edit', 'EventPeriodicController@edit')->name('edit');
            Route::post('/bulk-destroy', 'EventPeriodicController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{eventPeriodic}', 'EventPeriodicController@update')->name('update');
            Route::delete('/{eventPeriodic}', 'EventPeriodicController@destroy')->name('destroy');
            Route::get('/export', 'EventPeriodicController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('pages')->name('pages/')->group(static function () {
            Route::get('/', 'PageController@index')->name('index');
            Route::get('/create', 'PageController@create')->name('create');
            Route::post('/', 'PageController@store')->name('store');
            Route::get('/{page}/edit', 'PageController@edit')->name('edit');
            Route::post('/bulk-destroy', 'PageController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{page}', 'PageController@update')->name('update');
            Route::delete('/{page}', 'PageController@destroy')->name('destroy');
            Route::get('/export', 'PageController@export')->name('export');
        });
    });
});


/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('events')->name('events/')->group(static function () {
            Route::get('/', 'EventController@index')->name('index');
            Route::get('/archive', 'EventController@archive')->name('archive');
            Route::get('/create', 'EventController@create')->name('create');
            Route::post('/', 'EventController@store')->name('store');
            Route::get('/{event}/edit', 'EventController@edit')->name('edit');
            Route::post('/bulk-destroy', 'EventController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{event}', 'EventController@update')->name('update');
            Route::delete('/{event}', 'EventController@destroy')->name('destroy');
            Route::get('/export', 'EventController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('roles')->name('roles/')->group(static function () {
            Route::get('/', 'RoleController@index')->name('index');
            Route::get('/create', 'RoleController@create')->name('create');
            Route::post('/', 'RoleController@store')->name('store');
            Route::get('/{role}/edit', 'RoleController@edit')->name('edit');
            Route::post('/bulk-destroy', 'RoleController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{role}', 'RoleController@update')->name('update');
            Route::delete('/{role}', 'RoleController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('permissions')->name('permissions/')->group(static function () {
            Route::get('/', 'PermissionController@index')->name('index');
            Route::get('/create', 'PermissionController@create')->name('create');
            Route::post('/', 'PermissionController@store')->name('store');
            Route::get('/{permission}/edit', 'PermissionController@edit')->name('edit');
            Route::post('/bulk-destroy', 'PermissionController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{permission}', 'PermissionController@update')->name('update');
            Route::delete('/{permission}', 'PermissionController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('address-categories')->name('address-categories/')->group(static function () {
            Route::get('/', 'AddressCategoryController@index')->name('index');
            Route::get('/create', 'AddressCategoryController@create')->name('create');
            Route::post('/', 'AddressCategoryController@store')->name('store');
            Route::get('/{addressCategory}/edit', 'AddressCategoryController@edit')->name('edit');
            Route::post('/bulk-destroy', 'AddressCategoryController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{addressCategory}', 'AddressCategoryController@update')->name('update');
            Route::delete('/{addressCategory}', 'AddressCategoryController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('addresses')->name('addresses/')->group(static function () {
            Route::get('/', 'AddressController@index')->name('index');
            Route::get('/create', 'AddressController@create')->name('create');
            Route::post('/', 'AddressController@store')->name('store');
            Route::get('/{address}/edit', 'AddressController@edit')->name('edit');
            Route::post('/bulk-destroy', 'AddressController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{address}', 'AddressController@update')->name('update');
            Route::delete('/{address}', 'AddressController@destroy')->name('destroy');
            Route::get('/export', 'AddressController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('music-styles')->name('music-styles/')->group(static function () {
            Route::get('/', 'MusicStyleController@index')->name('index');
            Route::get('/create', 'MusicStyleController@create')->name('create');
            Route::post('/', 'MusicStyleController@store')->name('store');
            Route::get('/{musicStyle}/edit', 'MusicStyleController@edit')->name('edit');
            Route::post('/bulk-destroy', 'MusicStyleController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{musicStyle}', 'MusicStyleController@update')->name('update');
            Route::delete('/{musicStyle}', 'MusicStyleController@destroy')->name('destroy');
            Route::get('/export', 'MusicStyleController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('messages')->name('messages/')->group(static function () {
            Route::get('/', 'MessageController@index')->name('index');
            Route::get('/{message}/show', 'MessageController@show')->name('show');
            Route::post('/bulk-destroy', 'MessageController@bulkDestroy')->name('bulk-destroy');
            Route::delete('/{message}', 'MessageController@destroy')->name('destroy');
            Route::get('/export', 'MessageController@export')->name('export');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function () {
        Route::prefix('news')->name('news/')->group(static function () {
            Route::get('/', 'NewsController@index')->name('index');
            Route::get('/create', 'NewsController@create')->name('create');
            Route::post('/', 'NewsController@store')->name('store');
            Route::get('/{news}/edit', 'NewsController@edit')->name('edit');
            Route::post('/bulk-destroy', 'NewsController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{news}', 'NewsController@update')->name('update');
            Route::delete('/{news}', 'NewsController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])
    ->group(static function () {
        Route::prefix('admin')
        ->namespace('App\Http\Controllers\Admin')
        ->group(static function () {
            Route::prefix('menu')->group(static function () {
                Route::get('/', 'MenuController@show')->name('admin.menuShow');
                Route::get('edit', 'MenuController@edit')->name('admin.menuNew');
                Route::post('operation/{operation}', 'MenuController@operation')->name('admin.menuOperation');
                Route::post('store', 'MenuController@store')->name('admin.menuStore');
                Route::get('icons', 'MenuController@icons')->name('admin.menuIcons');
            });
        });
    });

Route::get("/static/{slug}", [StaticPageController::class, 'get'])->name("public.static");
Route::get('/feed', [EventController::class,'feed'])->name('public.feed');
Route::get('/remove/address/show/{token}', [ContactController::class,'removeAddressShow'])->name('public.removeAddressShow');
Route::post('/remove/address/hard/{token}', [ContactController::class,'removeAddressHard'])->name('public.removeAddressHard');

Route::get('', [EventController::class,'getActualMergedEvents'])->name('public.events');
Route::get('/show/{date}', [EventController::class,'show'])->name('public.event.eventsShow');
Route::get('/calendar/{year}/{month}', [EventController::class,'calendar'])->name('public.eventCalendar');

Route::get('/category/{slug}', [EventController::class,'getActualMergedEventsByCategory'])->name('public.eventsByCategory');
Route::get('/theme/{slug}', [EventController::class,'getActualMergedEventsByTheme'])->name('public.eventsByTheme');
Route::get('/page/{slug}', [PageController::class, 'get'])->name('public.page');

Route::prefix('contact')->group(function () {
    Route::get('/bands', [ContactController::class, 'formBands'])->name('public.bands.form');
    Route::post('/sendBands', [ContactController::class, 'sendBands'])->name('public.bands.send');
});
