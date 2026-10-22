@extends('layouts.public')

@section('title', 'Location')

@section('extra-headers')
    <link rel="stylesheet" href="{{ asset('vendor/leaflet/leaflet.css') }}">
    <script src="{{ asset('vendor/leaflet/leaflet.js') }}"></script>
@endsection

@section('sidebar-left')
    @parent
@endsection

@section('content')
    <div class="static-page col-12">
        <h3 class="page-header mt-2">Adresse</h3>
        <div class="address col-12">
            <span>Tucholskystraße 30, 10117 Berlin</span><br>
            <span>Fon: 030 2807664</span><br>
            <span>Email: <a href="mailto:hannes@zosch-berlin.de" target="_blank">hannes@zosch-berlin.de</a></span>
        </div>
        <div id="map" class="mt-2 col-12 col-md-6"></div>
    </div>

@endsection

@section('sidebar-right')
    @parent
@endsection

@section('inline-scripts')
<script>
    $(document).ready(function(){
        var lat = 52.529745,
            lng = 13.397245,
            location = [lat, lng],
            zoom = 16,
            map = L.map('map').setView(location, zoom),
            popup = L.popup()
                .setLatLng(location)
                .setContent('<p>Schokoladen Berlin-Mitte<br />Ackerstrasse 169</p>'),
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
