<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToEventTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('event', function (Blueprint $table) {
            $table->foreign('category_id')->references('id')->on('category')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign('created_by')->references('id')->on('admin_users')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign('theme_id')->references('id')->on('theme')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign('updated_by')->references('id')->on('admin_users')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('event', function (Blueprint $table) {
            $table->dropForeign('event_category_id_foreign');
            $table->dropForeign('event_created_by_foreign');
            $table->dropForeign('event_theme_id_foreign');
            $table->dropForeign('event_updated_by_foreign');
        });
    }
}
