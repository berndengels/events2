<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('parent_id')->nullable()->index('menu_parent_id_foreign');
            $table->unsignedInteger('menu_item_type_id')->nullable()->index('menu_menu_item_type_id_foreign');
            $table->binary('name');
            $table->string('css_class', 50)->nullable();
            $table->string('icon', 50)->nullable();
            $table->string('fa_icon', 50)->nullable();
            $table->string('url')->nullable();
            $table->integer('lft');
            $table->integer('rgt');
            $table->integer('lvl');
            $table->tinyInteger('api_enabled')->default(0);
            $table->tinyInteger('is_published')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('menu');
    }
}
