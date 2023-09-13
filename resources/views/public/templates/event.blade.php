@php
    $domID = $event->getDomId()
@endphp
<div class="collapseToggle mbs">
    <div class="eventHeader col-12 p-2">

        <div class="subHeader m-0 p-0">
            <span class="ml-2">{{ $event->getEventDate()->formatLocalized('%A') }}</span>
            <span class="ml-1">{{ $event->getEventDate()->formatLocalized('%d.%m.') }}</span>
            <span class="ml-1">{{ $event->getEventTime() }} Uhr</span>

            @if($event->getCategory())
                <!--i class="ion-{{ $event->getCategory()->icon }} category d-inline-block d-md-none" title="{{ $event->getCategory()->name }}"></i-->
                <span class="category mr-1">{{ $event->getCategory()->name }}</span>
            @endif
        </div>

        <div class="title m-0 p-0">
            <div class="p-0">
                @if ($event->getTheme())
                    <div class="theme d-inline mr-2">
                        <span>{{ $event->getTheme()->name }}</span>
                    </div>
                @endif
                {{ $event->getTitle() }}
            </div>
        </div>
   @if($event->getImages()->count() > 0 || $event->getDescription())
        <button class="btn btn-info btn-sm" data-toggle="collapse" data-target="#{{ $domID }}" role="button" aria-expanded="false" aria-controls="{{ $domID }}">open</button>
   @endif
    </div>
</div>

<div id="{{ $domID }}" class="eventBody collapse col-12 mt-0 pt-0">
    @if($event->getImages()->count() === 1)
        {? $img = $event->getImages()->first() ?}
        <div class="col-12 text-center w-100 m-0 p-0 imageWrapper">
            <img src="{{ asset($img->getUrl()) }}"
                 class="w-auto m-auto"
                 title=""
                 alt=""
            >
        </div>
    @elseif ($event->getImages()->count() > 1 )
        <div id="imgCarousel{{ $domID }}"
             class="carousel slide text-center col-12"
             data-ride="carousel"
             data-interval="4000"
        >
            <!-- Indicators -->
            <ul class="carousel-indicators">
                @foreach($event->getImages() as $index => $img)
                <li data-target="imgCarousel{{ $domID }}" data-slide-to="{{ $index }}" @if($index == 0) class="active" @endif></li>
                @endforeach()
            </ul>

            <div class="carousel-inner text-center col-12 w-100 m-0 p-0">
                @foreach($event->getImages() as $index => $img)
                    <div class="carousel-item w-100 m-0 p-0 @if($index == 0) active @endif">
                        <img src="{{ asset($img->getUrl()) }}"
                             class="w-auto m-auto"
                             title=""
                             alt=""
                        >
                    </div>
                @endforeach()
            </div>

            <a class="carousel-control-prev" href="#imgCarousel{{ $domID }}" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Zurück</span>
            </a>
            <a class="carousel-control-next" href="#imgCarousel{{ $domID }}" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Weiter</span>
            </a>
        </div>
    @endif

    @if ($event->getSubtitle())
        <div class="subtitle col-12 m-0 p-2">
            <span>{{ $event->getSubtitle() }}</span>
        </div>
    @endif

    @if($event->getDescription())
        <div class="text col-12 m-0 p-2"><p>{!! $event->getDescription() !!}</p></div>
    @endif
    @if ( $event->getLinks() && $event->getLinks()->count() )
        <div class="links col-12 m-0 p-2">
            @foreach($event->getLinks() as $link)
                <a href="{{ $link }}" target="_blank">{{ $link }}</a><br>
            @endforeach
        </div>
    @endif
</div>
