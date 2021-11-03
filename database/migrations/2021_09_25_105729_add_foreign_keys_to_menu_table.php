<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToMenuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('menu', function (Blueprint $table) {
            $table->foreign('menu_item_type_id')->references('id')->on('menu_item_type')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign('parent_id')->references('id')->on('menu')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('menu', function (Blueprint $table) {
            $table->dropForeign('menu_menu_item_type_id_foreign');
            $table->dropForeign('menu_parent_id_foreign');
        });
    }
}
