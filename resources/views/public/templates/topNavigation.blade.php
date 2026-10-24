<nav class="navbar fixed-top navbar-dark navbar-expand bg-black" id="topNav">
    <div class="container-fluid">
        <a class="navbar-brand" href="/events">Zosch-Berlin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTop" aria-controls="navbarTop" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        @if($topMenu && $topMenu->count() > 0)
            <div class="collapse navbar-collapse ms-5" id="navbarTop">
                @foreach ($topMenu as $item)
                    @if($item->children->count() > 0)
                        <ul class="navbar-nav ms-3">
                            <li class="nav-item dropdown">
                                <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    {{ $item->name }}
                                </button>
                                <ul class="dropdown-menu dropdown-menu-dark">
                                    @foreach ($item->children as $child)
                                        <li><a class="dropdown-item" href="{{ $child->url }}">{{ $child->name }}</a></li>
                                    @endforeach
                                </ul>
                            </li>
                        </ul>
                    @else
                        <a class="nav-link {{ $item->css_class ?? null }}" href="{{ $item->url }}" aria-haspopup="false">
                            @if($item->fa_icon && '' !== $item->fa_icon)
                                <i class="{{ $item->fa_icon }}"></i>
                            @endif
                            {{ $item->name }}<span class="ml-2 sr-only">(current)</span>
                        </a>
                    @endif
                @endforeach
            </div>
        @endif
    </div>
</nav>
