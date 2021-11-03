@extends('layouts.public')

@section('extra-headers')
    {!! NoCaptcha::renderJs() !!}
@endsection

@section('title', 'Kontakt für Bands')

@section('sidebar-left')
    @parent
@endsection

@section('content')
    <div class="contact w-100 align-content-center">
        <x-form method="post" class="mx-3" :action="route('public.bands.send')">
            @if(config('my.musicStyles.enabled'))
                <x-form-select name="music_style_id" label="Musikrichtung" :options="$musicStyleOptions" />
            @endif
            <x-form-input name="name" type="text" label="Name" required autocomplete="name" />
            <x-form-input name="email" type="email" label="Email" required autocomplete="email" />
            <x-form-textarea name="message" label="Nachricht" required />

            @if (isset($errors) && $errors->has('g-recaptcha-response'))
                <div class="captcha-error mx-auto">
                    <b>{!! $errors->first('g-recaptcha-response') !!}</b>
                </div>
            @endif
            {!! NoCaptcha::display(['class'=>'mbs']) !!}
            <div class="mt-4">
                <x-form-submit class="btn btn-primary" name="submit">Nachricht Senden</x-form-submit>
            </div>
        </x-form>
    </div>
@endsection

@section('sidebar-right')
    @parent
@endsection
