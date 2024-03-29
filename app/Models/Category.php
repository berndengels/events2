<?php

namespace App\Models;

use Eloquent;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * App\Models\Category
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property string|null $icon
 * @property-read Collection|EventPeriodic[] $eventPeriodics
 * @property-read int|null $event_periodics_count
 * @property-read Collection|EventTemplate[] $eventTemplates
 * @property-read int|null $event_templates_count
 * @property-read Collection|Event[] $events
 * @property-read int|null $events_count
 * @property-read mixed $resource_url
 * @method static Builder|Category newModelQuery()
 * @method static Builder|Category newQuery()
 * @method static Builder|Category query()
 * @method static Builder|Category whereIcon($value)
 * @method static Builder|Category whereId($value)
 * @method static Builder|Category whereName($value)
 * @method static Builder|Category whereSlug($value)
 * @mixin Eloquent
 * @property-read array $translations
 */
class Category extends Model
{
    protected $table = 'category';
    protected $fillable = [
        'name',
        'icon',
    ];

    public $timestamps = false;
    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/categories/'.$this->getKey());
    }

    public static function boot() {
        parent::boot();
        self::creating(function($model) {
            $model->slug = Str::slug(str_replace('.','_',$model->name), '-', 'de');
        });
        self::updating(function($model) {
            $model->slug = Str::slug(str_replace('.','_',$model->name), '-', 'de');
        });
    }

    public function delete()
    {
        $count = $this->events->count();
        if($count > 0) {
            return back()
                ->with('error','Es existieren noch Events ('.$count.') mit dieser Kategorie! Bitte vorher löschen.');
        }
        $count = $this->eventTemplates->count();
        if($count > 0) {
            return back()
                ->with('error','Es existieren noch Event Templates ('.$count.') mit dieser Kategorie! Bitte vorher löschen.');
        }
        $count = $this->eventPeriodics->count();
        if($count > 0) {
            return back()
                ->with('error','Es existieren noch periodische Event ('.$count.') mit dieser Kategorie! Bitte vorher löschen.');
        }
        return parent::delete();
    }

    /**
     * @return HasMany
     */
    public function events()
    {
        return $this->hasMany(Event::class);
    }

    /**
     * @return HasMany
     */
    public function eventTemplates()
    {
        return $this->hasMany(EventTemplate::class);
    }

    /**
     * @return HasMany
     */
    public function eventPeriodics()
    {
        return $this->hasMany(EventPeriodic::class);
    }
}
