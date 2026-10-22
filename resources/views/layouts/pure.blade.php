<!doctype html>
<html>
<head>
    <title>Zosch @yield('title')</title>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="index, follow" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="description" content="Zosch-Berlin" />
    <meta name="keywords" content="Zosch,Berlin,Musik,Musik Cafe,Kneipe,Kultur,Szene,Subkultur,Konzerte,Livemusik,live music,Veranstaltungs-Kneipe,Veranstaltungen,Lesung,alternativ" />
    <meta http-equiv="Content-Security-Policy"
          content="default-src * data: blob: 'self' 'unsafe-inline';script-src * data: blob: 'self' 'inline' 'unsafe-inline' 'unsafe-eval';img-src * 'self' data:"/>
    <meta http-equiv="imagetoolbar" content="no" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet" href="{{ asset('css/pure.css') }}" />
</head>
<body>
<div class="container w-100">
    @yield('content')
</div>
</body>
</html>
