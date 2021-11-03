<!doctype html>
<html>
<head>
    <title>Zosch @yield('title')</title>
    <meta charset="utf-8">
    {!! Feed::link(url('feed'), 'rss', 'Zosch Feed') !!}
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="index, follow" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="format-detection" content="telephone=yes" />
    <!-- Für Apple-Geräte -->
    <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-touch-icon-180x180.png">
    <!-- Für Browser -->
    <link rel="shortcut icon" type="image/x-icon" href="/favicon/favicon-32x32.ico">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png">
    <!-- Für Windows Metro -->
    <meta name="msapplication-square310x310logo" content="/favicon/mstile-310x310.png">
    <meta name="msapplication-TileColor" content="#23594F">
    <meta name="description" content="Zosch Berlin" />
    <meta name="keywords" content="Zosch,Berlin,Musik,Musik Cafe,Kneipe,Kultur,Szene,Subkultur,Konzerte,Livemusik,live music,Veranstaltungs-Kneipe,Veranstaltungen" />
    <meta http-equiv="Content-Security-Policy"
          content="default-src * data: blob: 'self' 'unsafe-inline';script-src * data: blob: 'self' 'inline' 'unsafe-inline' 'unsafe-eval';img-src * 'self' data:"/>
    <meta http-equiv="imagetoolbar" content="no" />
    @yield('extra-headers-top')
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">
    <link href="https://unpkg.com/ionicons@4.2.2/dist/css/ionicons.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="{{ asset('css/app.css') }}" />
    <script src="{{ asset('js/app.js') }}" type="text/javascript" charset="utf-8"></script>
    <script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>

    @yield('extra-headers')

</head>
<body>

@if(env('BOOTSTRAP_DEBUG'))
    @include('debug.bootstrap.display')
@endif

@include('components.flash-message')

<div class="container col-12">
    <div class="header">
        @section('header')
            @include('public.templates.topNavigation')
        @show
        @yield('header-content')
    </div>

    <div class="main row">
        <div id="content" class="content col-12 mb-5">
            @yield('sidebarLeft')
            @yield('content')
            @yield('sidebarRight')
        </div>
    </div>

    <div class="footer row">
        @section('bottom-navigation')
            @include('public.templates.bottomNavigation')
        @show
        @yield('footer-content')
    </div>
</div>
@yield('inline-scripts')

@if(config('piwik.url'))
    @include('public.analytic.piwik')
@endif

</body>
</html>
