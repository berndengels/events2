<?php

namespace App\ModelsOld;

use App\Helper\MyLang;
use Eloquent;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Country
 *
 * @property int $id
 * @property string $code
 * @property string $en
 * @property string $de
 * @property string $es
 * @property string $fr
 * @property string $it
 * @property string $ru
 * @property-read mixed $name
 * @property-read mixed $resource_url
 * @method static Builder|Country newModelQuery()
 * @method static Builder|Country newQuery()
 * @method static Builder|Country query()
 * @method static Builder|Country whereCode($value)
 * @method static Builder|Country whereDe($value)
 * @method static Builder|Country whereEn($value)
 * @method static Builder|Country whereEs($value)
 * @method static Builder|Country whereFr($value)
 * @method static Builder|Country whereId($value)
 * @method static Builder|Country whereIt($value)
 * @method static Builder|Country whereRu($value)
 * @mixin Eloquent
 */
class Country extends Model
{
    protected $table = 'countries';
    public $timestamps = false;
    protected $appends = ['resource_url','name'];
    protected $fillable = [
        'code',
        'en',
        'de',
        'es',
        'fr',
        'it',
        'ru',
    ];

    public function getNameAttribute()
    {
        $language = MyLang::getPrimary();
        if($language) {
            return $this->$language;
        }
        return $this->de;
    }

    public function __toString()
    {
        return $this->name;
    }

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/countries/'.$this->getKey());
    }
}
