<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
	public function phpinfo()
	{
		$this->entity = 'info';
		$title = 'PHP-Info';

		ob_start();
		phpinfo();
		$html = ob_get_contents();
		ob_end_clean();
		[,$body] = explode('<body>', $html);
		[$body,] = explode('</body>', $body);
		$body = trim($body);

		return view('admin.phpinfo', compact( 'body', 'title'));
	}
}
