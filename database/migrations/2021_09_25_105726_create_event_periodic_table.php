<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventPeriodicTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_periodic', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('theme_id')->nullable()->index('event_periodic_theme_id_foreign');
            $table->unsignedInteger('category_id')->index('event_periodic_category_id_foreign');
            $table->string('periodic_position', 50);
            $table->string('periodic_weekday', 50);
            $table->unsignedInteger('created_by')->index('event_periodic_created_by_foreign');
            $table->unsignedInteger('updated_by')->nullable()->index('event_periodic_updated_by_foreign');
            $table->string('title');
            $table->string('subtitle')->nullable();
            $table->longText('description')->nullable();
            $table->longText('links')->nullable();
            $table->date('event_date')->nullable();
            $table->time('event_time');
            $table->decimal('price')->nullable();
            $table->tinyInteger('is_published')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('event_periodic');
    }
}
