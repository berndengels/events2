<div class="dropdown-menu dropdown-menu-right">
    <div class="dropdown-header text-center"><strong>{{ trans('Account') }}</strong></div>
    <a href="{{ url('admin/profile') }}" class="dropdown-item"><i class="fa fa-customer"></i>  {{ trans('Profile') }}</a>
    <a href="{{ url('admin/password') }}" class="dropdown-item"><i class="fa fa-key"></i>  {{ trans('Passwort') }}</a>
    {{-- Do not delete me :) I'm used for auto-generation menu items --}}
    <a href="{{ url('admin/logout') }}" class="dropdown-item"><i class="fa fa-lock"></i> {{ trans('Logout') }}</a>
</div>
