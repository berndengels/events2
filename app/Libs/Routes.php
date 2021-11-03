<?php
namespace App\Libs;

use Route;
use App\Models\Theme;
use App\Models\Category;
use App\Repositories\PageRepository;

/**
 * App\Libs\Routes
 */
class Routes
{
	/**
	 * @var array
	 */
	private static $routes = [];

	public static function getRoutes($prefix = null )
	{
		$routes = collect(Route::getRoutes()->getRoutesByName());

		if( $prefix ) {
			$routes = $routes->reject(function ($value, $key) use ($prefix) {
				return !preg_match("#$prefix#", $key);
			});
		}
        /**
         * @var \Illuminate\Routing\Route $r
         */
		foreach($routes as $r) {
            if( !preg_match("/\{[^\}]+\}/", $r->uri) ) {
                $uri = '/' . $r->uri;
				self::$routes[$uri] = $uri;
			}
		}
		self::$routes = collect(self::$routes);
		return self::$routes;
	}

	public static function getPageRoutes()
	{
		return collect(PageRepository::getRoutes());
	}

	public static function getCategoryRoutes() {
        return Category::all()
            ->pluck('slug')
            ->mapWithKeys(function ($item) {
                return ["/category/$item" => "/category/$item"];
            });

    }

    public static function getStaticRoutes()
    {
        $staticRoutes = [];
        collect(config('view.paths'))->map(function($path) use (&$staticRoutes) {
            $path = $path . '/public/static';
            if(is_dir($path)) {
                foreach(scandir($path) as $item) {
                    if(false !== strrpos($item, '.blade.php')) {
                        $key = '/static/' . basename($item,'.blade.php');
                        $staticRoutes[$key] = $key;
                    }
                }
            }
        });
        return $staticRoutes;
    }

    public static function getThemeRoutes() {
        return Theme::all()->pluck('slug')
            ->mapWithKeys(function ($item) {
                return ["/theme/$item" => "/theme/$item"];
            });
    }

	public static function getPublicRoutes()
	{
        return self::getPageRoutes()
            ->merge(self::getRoutes('public'))
            ->merge(self::getCategoryRoutes())
            ->merge(self::getThemeRoutes())
            ->merge(self::getStaticRoutes());
	}
}
