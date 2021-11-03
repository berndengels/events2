@extends('admin.layout.default')
@section('title', trans('Edit', ['name' => $adminUser->first_name]))
@section('body')
    <div class="container-xl">
        <div class="card">
            <admin-user-form
                :action="'{{ $adminUser->resource_url }}'"
                :data="{{ $adminUser->toJson() }}"
                :activation="!!'{{ $activation }}'"
                inline-template
            >
                <form class="form-horizontal form-edit" method="post" @submit.prevent="onSubmit" :action="action">
                    <div class="card-header">
                        <i class="fa fa-pencil"></i> {{ trans('edit', ['name' => $adminUser->first_name]) }}
                    </div>
                    <div class="card-body">
                        @include('admin.admin-user.components.form-elements')
                    </div>
                    <div class="card-footer">
	                    <button type="submit" class="btn btn-primary" :disabled="submiting">
		                    <i class="fa" :class="submiting ? 'fa-spinner' : 'fa-download'"></i>
                            {{ trans('save') }}
	                    </button>
                    </div>
                </form>
        </admin-user-form>
    </div>
</div>
@endsection