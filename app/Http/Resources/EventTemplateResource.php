<?php

namespace App\Http\Resources;

use App\Models\Images;
use Illuminate\Http\Request;
use App\Entities\ImageEntity;
use App\Models\EventTemplate;
use Illuminate\Http\Resources\Json\JsonResource;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class EventTemplateResource extends JsonResource
{

    /**
     * Transform the resource into an array.
     *
     * @param  Request  $request
     * @return array
     */
    public function toArray($request)
    {
		$imageEntities	= [];

		if($this->media && $this->media->count()) {
			/**
			 * @var \App\Models\Media $image
			 */
			foreach($this->media as $image) {
				$img = new ImageEntity();
				$img
                    ->setId($image->id)
                    ->setFileName($image->file_name)
                    ->setSize($image->size)
                    ->setUrl($image->getUrl())
				;
				$imageEntities[] = $img->toObject();
			}
		}

        return [
			'id'            => $this->id,
			'title'         => $this->title,
			'subtitle'      => $this->subtitle,
			'description'   => $this->description,
            'category_id'   => $this->category->id,
            'theme_id'      => $this->theme->id,
			'links'         => $this->links,
			'thumbnails'	=> $this->thumbnails,
			'images'        => $imageEntities,
			'media'			=> $this->getThumbs200ForCollection('images'),
			'mediaCollection'	=> app(EventTemplate::class)->getMediaCollection('images')
		];
    }
}
