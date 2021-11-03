<?php
/**
 * GlobalsComposer.php
 *
 * @author    Bernd Engels
 * @created   09.05.19 22:31
 * @copyright Bernd Engels
 */

namespace App\Http\View\Composer;

use App\Helper\MyDate;
use App\Helper\MyLang;
use Illuminate\View\View;
use Jenssegers\Agent\Agent;

class GlobalsComposer {

	public function compose(View $view)
	{
		$view->with('today', MyDate::getToday());
		$view->with('untilValidDate', MyDate::getUntilValidDate());
		$view->with('agend', new Agent());
        $view->with('primaryLang', MyLang::getPrimary());
	}
}
