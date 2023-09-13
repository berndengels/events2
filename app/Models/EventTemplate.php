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
 * App\Models\EventTemplate
 *
 * @property int $id
 * @property int|null $theme_id
 * @property int $category_id
 * @property int $created_by
 * @property int|null $updated_by
 * @property string $title
 * @property string|null $subtitle
 * @property string|null $description
 * @property string|null $links
 * @property string|null $created_at
 * @property string|null $updated_at
 * @property-read Category $category
 * @property-read \Brackets\AdminAuth\Models\AdminUser $createdBy
 * @property-read mixed $resource_url
 * @property-read Collection|Image[] $images
 * @property-read int|null $images_count
 * @property-read Theme|null $theme
 * @property-read \Brackets\AdminAuth\Models\AdminUser|null $updatedBy
 * @method static Builder|EventTemplate newModelQuery()
 * @method static Builder|EventTemplate newQuery()
 * @method static Builder|EventTemplate query()
 * @method static Builder|EventTemplate whereCategoryId($value)
 * @method static Builder|EventTemplate whereCreatedAt($value)
 * @method static Builder|EventTemplate whereCreatedBy($value)
 * @method static Builder|EventTemplate whereDescription($value)
 * @method static Builder|EventTemplate whereId($value)
 * @method static Builder|EventTemplate whereLinks($value)
 * @method static Builder|EventTemplate whereSubtitle($value)
 * @method static Builder|EventTemplate whereThemeId($value)
 * @method static Builder|EventTemplate whereTitle($value)
 * @method static Builder|EventTemplate whereUpdatedAt($value)
 * @method static Builder|EventTemplate whereUpdatedBy($value)
 * @mixin Eloquent
 */
class EventTemplate extends Model implements HasMediaAlias
{
	use HasAdminUser,
		ProcessMediaTrait,
		AutoProcessMediaTrait,
		HasMediaCollectionsTrait,
		HasMediaThumbsTrait;

    protected $table = 'event_template';
	private $mediaName = 'images';
	protected $guarded = ['id'];
	public $timestamps = false;
	protected $appends = ['resource_url','images','thumbnails','mediaName'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/event-templates/'.$this->getKey());
    }

    public function setImagesAttribute() {
        $this->images = collect([]);
    }

	public function getMediaNameAttribute()
	{
		return $this->mediaName;
	}

	public function getImagesAttribute() {
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
