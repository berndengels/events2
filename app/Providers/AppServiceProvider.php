<?php
namespace App\Providers;

use App\View\Components\Form\Input\Checkbox;
use App\View\Components\Form\Input\Date;
use App\View\Components\Form\Input\Email;
use App\View\Components\Form\Input\File;
use App\View\Components\Form\Input\Password;
use App\View\Components\Form\Input\Radio;
use App\View\Components\Form\Input\Select;
use App\View\Components\Form\Input\Submit;
use App\View\Components\Form\Input\Text;
use App\View\Components\Form\Input\Textarea;
use App\View\Components\Form\Input\Time;
use Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        setlocale(LC_TIME, 'de_DE.utf8');
        Carbon::setLocale('de');
        if (!$this->app->environment('prod')) {
            $this->app->register(IdeHelperServiceProvider::class);
            $this->app->register(\PrettyRoutes\ServiceProvider::class);
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if(!session()->isStarted()) {
            session()->start();
        }

        Schema::defaultStringLength(191);

        Blade::directive('brutto', function ($expression) {
            return "<?php echo \App\Helper\MyMoney::getBrutto($expression); ?>";
        });
        Blade::directive('netto', function ($expression) {
            return "<?php echo \App\Helper\MyMoney::getNetto($expression); ?>";
        });
        Blade::directive('nettoRounded', function ($expression) {
            return "<?php echo \App\Helper\MyMoney::getNettoRounded($expression); ?>";
        });
        Blade::directive('round', function ($expression) {
            return "<?php echo \App\Helper\MyMoney::getRounded($expression); ?>";
        });

        Blade::extend(function($value) {
            return preg_replace('/\{\?(.+)\?\}/', '<?php ${1} ?>', $value);
        });

        if (!Collection::hasMacro('paginate')) {

            Collection::macro('paginate',
                function ($perPage = 15, $page = null, $options = []) {
                    $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
                    return (new LengthAwarePaginator(
                        $this->forPage($page, $perPage), $this->count(), $perPage, $page, $options))
                        ->withPath('');
                });
        }

        if(env('REDIRECT_HTTPS')) {
            URL::forceScheme('https');
        }
    }
}
