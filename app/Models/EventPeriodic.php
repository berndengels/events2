<?php

namespace App\Models;

use Eloquent;
use App\Models\Ext\HasAdminUser;
use Brackets\Media\HasMedia\AutoProcessMediaTrait;
use Brackets\Media\HasMedia\HasMediaCollectionsTrait;
use Brackets\Media\HasMedia\HasMediaThumbsTrait;
use Brackets\Media\HasMedia\ProcessMediaTrait;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\MediaLibrary\HasMedia as HasMediaAlias;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

/**
 * App\Models\EventPeriodic
 *
 * @property int $id
 * @property int|null $theme_id
 * @property int $category_id
 * @property string $periodic_position
 * @property string $periodic_weekday
 * @property int $created_by
 * @property int|null $updated_by
 * @property string $title
 * @property string|null $subtitle
 * @property string|null $description
 * @property string|null $links
 * @property string $event_date
 * @property string $event_time
 * @property string|null $price
 * @property int $is_published
 * @property string|null $created_at
 * @property string|null $updated_at
 * @property-read Category $category
 * @property-read \Brackets\AdminAuth\Models\AdminUser $createdBy
 * @property-read mixed $resource_url
 * @property-read Collection|Image[] $images
 * @property-read int|null $images_count
 * @property-read Theme|null $theme
 * @property-read \Brackets\AdminAuth\Models\AdminUser|null $updatedBy
 * @method static Builder|EventPeriodic newModelQuery()
 * @method static Builder|EventPeriodic newQuery()
 * @method static Builder|EventPeriodic query()
 * @method static Builder|EventPeriodic whereCategoryId($value)
 * @method static Builder|EventPeriodic whereCreatedAt($value)
 * @method static Builder|EventPeriodic whereCreatedBy($value)
 * @method static Builder|EventPeriodic whereDescription($value)
 * @method static Builder|EventPeriodic whereEventDate($value)
 * @method static Builder|EventPeriodic whereEventTime($value)
 * @method static Builder|EventPeriodic whereId($value)
 * @method static Builder|EventPeriodic whereIsPublished($value)
 * @method static Builder|EventPeriodic whereLinks($value)
 * @method static Builder|EventPeriodic wherePeriodicPosition($value)
 * @method static Builder|EventPeriodic wherePeriodicWeekday($value)
 * @method static Builder|EventPeriodic wherePrice($value)
 * @method static Builder|EventPeriodic whereSubtitle($value)
 * @method static Builder|EventPeriodic whereThemeId($value)
 * @method static Builder|EventPeriodic whereTitle($value)
 * @method static Builder|EventPeriodic whereUpdatedAt($value)
 * @method static Builder|EventPeriodic whereUpdatedBy($value)
 * @mixin Eloquent
 */
class EventPeriodic extends Model  implements HasMediaAlias
{
	use HasAdminUser,
		ProcessMediaTrait,
		AutoProcessMediaTrait,
		HasMediaCollectionsTrait,
		HasMediaThumbsTrait;

    private $mediaName = 'images';
    protected $table = 'event_periodic';
    protected $guarded = ['id'];
    public $timestamps = true;
    protected $appends = ['resource_url','images','thumbnails','mediaName'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/event-periodics/'.$this->getKey());
    }

    public function getMediaNameAttribute()
    {
        return $this->mediaName;
    }

    public function getImagesAttribute() {
        if($this->hasMedia($this->mediaName)) {
            return $this->getMedia($this->mediaName);
        }
        return collect([]);
    }

    public function getThumbnailsAttribute() {
        if($this->hasMedia($this->mediaName)) {
            return $this->getThumbs200ForCollection($this->mediaName);
        }
        return collect([]);
    }

    /**
     * @return BelongsTo
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    /**
     * @return BelongsTo
     */
    public function theme()
    {
        return $this->belongsTo(Theme::class);
    }

    public function registerMediaConversions( Media $media = null ): void
    {
        $this->autoRegisterThumb200();
        $this->addMediaConversion('detail_hd')
            ->width(1920)
            ->height(1080)
            ->performOnCollections($this->mediaName);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection($this->mediaName)
            ->useDisk('images')
            ->accepts('image/jpeg','image/jpg')
            ->maxNumberOfFiles(3) // Set the file count limit
            ->maxFilesize(5*1024*1024) // Set the file size limit
        ;
    }
}
