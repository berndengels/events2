@extends('layouts.public')

@section('title', 'Location')

@section('extra-headers')
    <link rel="stylesheet" href="{{ asset('vendor/leaflet/leaflet.css') }}">
    <script src="{{ asset('vendor/leaflet/leaflet.js') }}"></script>
@endsection

@section('content')
    <div class="mt-5 static">
        <h3 class="page-header mt-2">Adresse</h3>
        <div class="address">
            <span>Tucholskystraße 30, 10117 Berlin</span><br>
            <span>Fon: 030 2807664</span><br>
            <span>Email: <a href="mailto:hannes@zosch-berlin.de" target="_blank">hannes@zosch-berlin.de</a></span>
        </div>
        <div id="map" class="mt-2"></div>
    </div>
@endsection

@section('inline-scripts')
<script>
    $(document).ready(() => {
        var lat = 52.526039,
            lng = 13.393677,
            location = [lat, lng],
            zoom = 16,
            map = L.map('map').setView(location, zoom),
            popup = L.popup()
                .setLatLng(location)
                .setContent('<p>Zosch-Berlin<br/>Tucholskystraße 30<br>10117 Berlin<br>Germany</p>'),
            marker = L.marker(location)
                 .addTo(map)
                 .bindPopup(popup)
                 .openPopup()
        ;

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/" class="mbs">OpenStreetMap</a>'
        }).addTo(map);
    });
</script>
@endsection
