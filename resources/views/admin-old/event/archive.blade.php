@extends('admin.layout.default')

@section('title', 'Archiv')

@section('body')

    <event-listing
        :data="{{ $data->toJson() }}"
        :url="'{{ url('admin/events/archive') }}'"
        :categories="{{ $categories->toJson() }}"
        inline-template
    >

        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        <i class="fa fa-align-justify"></i> Event Archiv
                        <form @submit.prevent class="d-inline-block justify-content-between align-middle">
                            <div class="col-sm-auto form-inline d-inline-block" v-if="showCategoryFilter">
                                <div class="input-group">
                                    <select
                                        id="category"
                                        name="category"
                                        class="form-control"
                                        v-model="categorySelect"
                                    >
                                        <option value="">{{ __('Type to search a category') }}</option>
                                        <option v-for="item in categories" :key="item.id" :value="item.id">
                                            @{{ item.name }}
                                        </option>
                                    </select>
                                    <span class="d-inline input-group-append">
                                        <button type="button" class="btn btn-primary"
                                                @click="filter('category', categorySelect)"><i class="fa fa-search"></i> Kategorie</button>
                                    </span>
                                </div>
                            </div>

                            <div class="col-sm-auto form-inline d-inline-block ml-0" v-if="showEventDateFilter">
                                <div class="d-inline-block">
                                    <label for="fromDate" class="d-inline">Von</label>
                                    <input
                                        type="date"
                                        id="fromDate"
                                        name="fromDate"
                                        v-model="fromDateSelect"
                                        class="form-control d-inline"
                                    />
                                </div>
                                <div class="d-inline-block">
                                    <label for="untilDate" class="d-inline">Bis </label>
                                    <input
                                        type="date"
                                        id="untilDate"
                                        name="untilDate"
                                        v-model="untilDateSelect"
                                        class="form-control d-inline"
                                    />
                                </div>
                                <div class="d-inline-block">
                                    <span class="d-inline input-group-append">
                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            @click="loadData(true)">
                                            <i class="fa fa-search"></i> search
                                        </button>
                                    </span>
                                </div>
                            </div>

                        </form>
                        <a class="btn btn-primary btn-sm pull-right m-b-0 ml-2" href="{{ url('admin/events/export') }}" role="button"><i class="fa fa-file-excel-o"></i>&nbsp; {{ trans('admin.event.actions.export') }}</a>
                    </div>
                    <div class="card-body" v-cloak>
                        <div class="card-block">
                            <form @submit.prevent="">
                                <div class="row justify-content-md-between">

                                    <div class="col-sm-3 form-group">
                                        <div class="input-group">
                                            <input class="form-control"
                                                   placeholder="{{ trans('brackets/admin-ui::admin.placeholder.search') }}"
                                                   v-model="search"
                                                   @keyup.enter="filter('search', $event.target.value)"
                                            />
                                            <span class="input-group-append">
                                                <button type="button" class="btn btn-primary"
                                                        @click="filter('search', search)"><i class="fa fa-search"></i>&nbsp; {{ trans('brackets/admin-ui::admin.btn.search') }}</button>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="col-sm-2 form-group float-right">
                                        <select class="form-control" v-model="pagination.state.per_page">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="100">100</option>
                                        </select>
                                    </div>
                                </div>
                            </form>

                            <table class="table table-hover table-listing">
                                <thead>
                                    <tr>
                                        <th is='sortable' :column="'id'">{{ trans('admin.event.columns.id') }}</th>
                                        <th is='sortable' :column="'theme_id'">{{ trans('admin.event.columns.theme_id') }}</th>
                                        <th is='sortable' :column="'category_id'">{{ trans('admin.event.columns.category_id') }}</th>
                                        <th is='sortable' :column="'title'">{{ trans('admin.event.columns.title') }}</th>
                                        <th is='sortable' :column="'event_date'">{{ trans('admin.event.columns.event_date') }}</th>
                                        <th is='sortable' :column="'is_published'">{{ trans('admin.event.columns.is_published') }}</th>
                                        <th is='sortable' :column="'created_by'">{{ trans('admin.event.columns.created_by') }}</th>
                                        <th is='sortable' :column="'updated_by'">{{ trans('admin.event.columns.updated_by') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in collection" :key="item.id" :class="bulkItems[item.id] ? 'bg-bulk' : ''">
                                        <td>@{{ item.id }}</td>
                                        <td>@{{ item.theme ? item.theme.name : null }}</td>
                                        <td>@{{ item.category.name }}</td>
                                        <td v-html="item.title"></td>
                                        <td>@{{ item.event_date | date('DD.MM.Y') }}</td>
                                        <td>@{{ item.is_published }}</td>
                                        <td>@{{ item.created_by.full_name }}</td>
                                        <td>@{{ item.updated_by ? item.updated_by.full_name : null }}</td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="row" v-if="pagination.state.total > 0">
                                <div class="col-sm">
                                    <span class="pagination-caption">{{ trans('brackets/admin-ui::admin.pagination.overview') }}</span>
                                </div>
                                <div class="col-sm-auto">
                                    <pagination></pagination>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </event-listing>

@endsection
