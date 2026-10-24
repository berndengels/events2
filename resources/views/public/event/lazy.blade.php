@extends('layouts.public')

@section('title', 'Events')

@section('extra-headers-top')
    <link rel="stylesheet" href="{{ asset('vendor/calendar/css/zabuto_calendar.min.css') }}">
@endsection

@section('extra-headers')
    <script src="{{ asset('vendor/calendar/js/zabuto_calendar.min.js') }}"></script>
@endsection

@section('content')
    <div class="row">
        <div class="eventContainer accordion col-lg-6 col-sm-12" id="eventAccordion">
            @if($data->count() > 0)
                @foreach ($data->values() as $index => $event)
                    <x-event :index="$index" :event="$event" accordion-id="eventAccordion" />
                @endforeach
            @else
                <h5 class="w-100 text-center mt-5 mbs">Sorry, keine Daten vorhanden</h5>
            @endif
        </div>
    </div>
@endsection

{{--
@section('sidebarRight')
    <div class="sidebar-right d-none d-md-block col-md-4 ml-0 ms-lg-2">
        <div class="header">
            <span>Event Kalender</span>
        </div>
        <div id="calendar" class="m-0 p-0"></div>
    </div>
@endsection

@section('inline-scripts')
    <script>
        $(() => {
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth() + 1;

            $("#calendar").zabuto_calendar({
                language: 'de',
                year: year,
                month: month,
                show_previous: false,
                show_next: 6,
                cell_border: false,
                today: true,
                show_days: true,
                weekstartson: 1,
                nav_icon: {
                    prev: '<ion-icon name="arrow-dropleft-circle"></ion-icon>',
                    next: '<ion-icon name="arrow-dropright-circle"></ion-icon>'
                },
                ajax: {
	                url: "/calendar/" + year + "/" + month,
                    modal: true,
                },
                legend: false, // object array, [{type: string, label: string, classname: string}]
            });
        });
    </script>
@endsection
--}}



