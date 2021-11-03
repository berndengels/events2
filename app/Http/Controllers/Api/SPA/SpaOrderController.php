<?php

namespace App\Http\Controllers\Api\SPA;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Payment\Stripe\PortoPrice;

class SpaOrderController extends Controller
{

    public function order(Request $request)
    {
        $data = json_decode($request->input('data'));
        return response()->json($data);

        $cart = null;
        $this->middleware('auth');
        /**
         * @var Customer $customer
         */
        $customer   = auth('web')->user();
        $shippings  = $customer->shippings;
        if (!$shippings->count() > 0) {
            return redirect()->route('shipping.create', ['redirectTo' => 'public.order.index'])
                ->with(['ordering' => true, 'customer' => $customer]);
        }
        $shippingDefault = $shippings->where('is_default', true)->first();

        $content = null;
        if ($cart->content()->count()) {
            $content = $cart->content();
        }
        $porto = PortoPrice::getPrice($cart);

        return view('public.order.index', compact('cart', 'content', 'customer', 'shippings', 'shippingDefault', 'porto'));
    }
}
