<?php

namespace App\Http\Requests\Admin\EventPeriodic;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;

class StoreEventPeriodic extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return Gate::allows('event-periodic.create');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'theme_id' => '',
            'category_id' => ['required', 'integer'],
            'periodic_position' => ['required', 'string'],
            'periodic_weekday' => ['required', 'string'],
            'title' => ['required', 'string'],
            'event_time' => ['required', 'date_format:H:i:s'],
            'is_published' => ['required', 'boolean'],
            'subtitle' => '',
            'description' => '',
            'links' => '',
            'event_date' => '',
            'price' => '',
        ];
    }

    /**
    * Modify input data
    *
    * @return array
    */
    public function getSanitized(): array
    {
        $sanitized = $this->validated();

        //Add your code for manipulation with request data here

        return $sanitized;
    }
}
