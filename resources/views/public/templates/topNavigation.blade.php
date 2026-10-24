<div id="top-navigation">
    <nav class="navbar fixed-top navbar-expand-md navbar-dark bg-black">
        <a class="navbar-brand" href="/events">Zosch-Berlin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#topNavbar" aria-controls="topNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="topNavbar">
            <!-- left side -->
            <ul class="navbar-nav mr-auto">
                @foreach ($topMenu as $item)
                    <li class="nav-item dropdown">
                        @if($item->children->count())
                            <a class="nav-link dropdown-toggle" href="{{ $item->url }}" id="dropdown{{ $item->name }}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ $item->name }}<span class="ml-2 sr-only">(current)</span></a>
                            <div class="dropdown-menu" aria-labelledby="dropdown{{ $item->name }}">
                                @foreach ($item->children as $child)
                                    <a class="dropdown-item {{ $child->css_class ?? null }}" href="{{ $child->url }}">
                                        @if($child->fa_icon && '' !== $child->fa_icon)
                                            <i class="{{ $child->fa_icon }}"></i>
                                        @endif
                                        {{ $child->name }}
                                    </a>
                                @endforeach
                            </div>
                        @else
                            <a class="nav-link {{ $item->css_class ?? null }}" href="{{ $item->url }}" aria-haspopup="false">
                                @if($item->fa_icon && '' !== $item->fa_icon)
                                    <i class="{{ $item->fa_icon }}"></i>
                                @endif
                                {{ $item->name }}<span class="ml-2 sr-only">(current)</span>
                            </a>
                        @endif
                    </li>
                @endforeach
            </ul>
            <!--form class="form-inline my-2 my-md-0">
                <input class="form-control" type="text" placeholder="Suchen">
            </form-->
            <!-- Right Side Of Navbar -->
            <!--ul class="navbar-nav ml-auto">
                <li class="nav-item spacer d-none d-md-inline-block">&nbsp</li>
                <li class="nav-item dropdown"></li>
            </ul-->
       </div>
    </nav>
</div>
