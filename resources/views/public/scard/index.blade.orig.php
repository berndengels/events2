@extends('layouts.public')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="card w-75">
                <div class="card-header row">
                    <h3 class="col">Warenkorb</h3>
                    @if($content)
                    <a role="button" class="btn btn-danger d-inline-block col-sm-auto col-md-3 float-right"
                       href="{{ route('public.scard.destroy') }}"
                    ><i class="fas fa-trash-alt"></i>
                        Warenkorb leeren</a>
                   @endif
                </div>
                <div class="card-body row p-0 m-0 justify-content-center">
                    <ShoppingCart />
                    <div>
                        @guest
                            <h5>Um die Artikel zu bestellen, mußt Du Dich einloggen oder Registrieren</h5>
                            <div class="row justify-content-center">
                                <a role="button" class="btn btn-primary btnPay align-middle"
                                    href="{{ route('login', ['redirectTo' => 'public.scard.index']) }}" ><i class="fas fa-user-alt mr-1"></i>
                                    @lang('Login')
                                </a>
                                    &nbsp;
                                <a role="button"class="btn btn-primary ml-2 btnPay align-middle"
                                        href="{{ route('register', ['redirectTo' => 'public.scard.index']) }}"><i class="fas fa-cash-register mr-1"></i>
                                    @lang('Register')
                                </a>
                            </div>
                        @else
                            <a role="button" class="btn btn-block btn-primary px-5"
                               href="{{ route('public.order.index') }}">@lang('Kaufen')</a>
                        @endguest
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
<script>
	import ShoppingCart from "../../../js/components/ShoppingCart";
	export default {
		components: {ShoppingCart}
	}
</script>