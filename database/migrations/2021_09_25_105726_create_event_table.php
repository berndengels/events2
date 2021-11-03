<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('theme_id')->nullable()->index('event_theme_id_foreign');
            $table->unsignedInteger('category_id')->index('event_category_id_foreign');
            $table->unsignedInteger('created_by')->index('event_created_by_foreign');
            $table->unsignedInteger('updated_by')->nullable()->index('event_updated_by_foreign');
            $table->string('title');
            $table->string('subtitle')->nullable();
            $table->longText('description')->nullable();
            $table->longText('links')->nullable();
            $table->date('event_date');
            $table->time('event_time')->nullable();
            $table->decimal('price')->nullable();
            $table->tinyInteger('is_published')->default(0);
            $table->tinyInteger('is_periodic')->nullable()->default(0);
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
        Schema::dropIfExists('event');
    }
}
