@extends('layouts.public')

@section('title', $data->title)
@section('content')
<div class="justify-content-center page mt-3">
    <div>
        <h3>{{ $data->title }}</h3>
        <div class="pageContent">
            {!! $data->body !!}
        </div>
    </div>
</div>
@endsection
