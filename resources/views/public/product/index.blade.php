@extends('layouts.public')

@section('content')
    <div class="col-12">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Order Products</div>
                    <div class="card-body">
                        <div id="app">
                            <Shop :products='@json($data)'
                                  route-login="{{ route('login', ['redirectTo' => 'public.product.index']) }}"
                                  route-register="{{ route('register', ['redirectTo' => 'public.scard.index']) }}"
                                  route-order="{{ route('public.order.index') }}"
                                  @guest guest="1"@endguest
                            />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
