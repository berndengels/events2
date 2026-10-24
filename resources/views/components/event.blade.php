<div class="event accordion-item mt-2">
    @php
        $domID = 'e' . $event->getEventDate()->format('Ymd')
    @endphp

    <div class="mbs">
        <div class="eventHeader accordion-header m-0 p-0">

            <div class="subHeader accordion-button" data-bs-toggle="collapse" data-bs-target="#{{ $domID }}" aria-expanded="true" aria-controls="{{ $domID }}">
                <span class="ms-2">{{ $event->getEventDate()->translatedFormat('D') }}</span>
                <span class="ms-2">{{ $event->getEventDate()->translatedFormat('d.m.Y') }}</span>
                <span class="ms-2">{{ $event->getEventTime() }} Uhr</span>

                @if($event->getCategory())
                    <div class="category">{{ $event->getCategory()->name }}</div>
                @endif
            </div>

            @if ($event->getTheme())
                <div class="theme p-0 ps-2 m-0">
                    <h7>{{ $event->getTheme()->name }}</h7>
                </div>
            @endif

            <div class="title m-0 p-0">
                <div class="ms-2 p-0">
                    {{ $event->getTitle() }}
                </div>
            </div>
            <!--button class="btn btn-info btn-sm" data-bs-toggle="collapse" data-bs-target="#{{ $domID }}" role="button" aria-expanded="false" aria-controls="{{ $domID }}">open</button-->
        </div>
    </div>

    <div id="{{ $domID }}" class="eventContent accordion-collapse collapse @if(0 === $index) show @endif" data-bs-parent="#{{ $accordionId }}">
        <div class="accordion-body">
            @if($event->getImages()->count() === 1)
                {? $img = $event->getImages()->first() ?}
                <div class="col-12 text-center w-100 m-0 p-0 imageWrapper">
                    <img src="{{ asset($img->getUrl()) }}"
                         height="400"
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
                        @foreach($event->getImages() as $idx => $img)
                            <li data-target="imgCarousel{{ $domID }}" data-slide-to="{{ $idx }}" @if($idx === 0) class="active" @endif></li>
                        @endforeach()
                    </ul>

                    <div class="carousel-inner text-center col-12 w-100 m-0 p-0">
                        @foreach($event->getImages() as $index => $img)
                            <div class="carousel-item w-100 m-0 p-0 @if($index == 0) active @endif">
                                <img src="{{ asset($img->getUrl()) }}"
                                     height="400"
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

            @if ('' !== $event->getSubtitle())
                <div class="subtitle col-12 m-0 p-2">
                    <h6>{{ $event->getSubtitle() }}</h6>
                </div>
            @endif

            <div class="text col-12 m-0 p-2">
                {!! $event->getDescription() !!}
            </div>

            @if ( $event->getLinks() && $event->getLinks()->count() > 0 )
                <div class="links col-12 m-0 p-2">
                    @foreach($event->getLinks() as $link)
                        <a href="{{ $link }}" target="_blank">{{ $link }}</a><br>
                    @endforeach
                </div>
            @endif
        </div>
    </div>
</div>