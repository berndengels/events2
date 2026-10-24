<nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-black p-2" id="topNav">
    <div class="container-fluid">
        <a class="navbar-brand" href="/events">Zosch-Berlin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    @if($topMenu && $topMenu->count() > 0)
        @foreach ($topMenu as $item)
            @if($item->children->count() > 0)
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown{{ $item->id }}">
                    <ul class="navbar-nav">
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
                </div>
            @else
                <a class="nav-link {{ $item->css_class ?? null }}" href="{{ $item->url }}" aria-haspopup="false">
                    @if($item->fa_icon && '' !== $item->fa_icon)
                        <i class="{{ $item->fa_icon }}"></i>
                    @endif
                    {{ $item->name }}<span class="ml-2 sr-only">(current)</span>
                </a>
            @endif
        @endforeach
    @endif
    </div>
</nav>
