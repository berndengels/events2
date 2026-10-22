<?php

namespace App\Http\Controllers\Api;

use App\Models\EventTemplate;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Response;
use App\Http\Resources\EventTemplateResource;

class ApiEventTemplateController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function get(EventTemplate $eventTemplate)
    {
		$eventTemplate->load(['media']);
		EventTemplateResource::withoutWrapping();

		return new EventTemplateResource($eventTemplate);
    }
}
