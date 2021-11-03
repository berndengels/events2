<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventTemplateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('event_template', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('theme_id')->nullable()->index('event_template_theme_id_foreign');
            $table->unsignedInteger('category_id')->index('event_template_category_id_foreign');
            $table->unsignedInteger('created_by')->index('event_template_created_by_foreign');
            $table->unsignedInteger('updated_by')->nullable()->index('event_template_updated_by_foreign');
            $table->string('title');
            $table->string('subtitle')->nullable();
            $table->longText('description')->nullable();
            $table->text('links')->nullable();
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
        Schema::dropIfExists('event_template');
    }
}
