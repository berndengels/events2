<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToAdminUsersMusicStyleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('admin_users_music_style', function (Blueprint $table) {
            $table->foreign('admin_user_id')->references('id')->on('admin_users')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign('music_style_id')->references('id')->on('music_style')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('admin_users_music_style', function (Blueprint $table) {
            $table->dropForeign('admin_users_music_style_admin_user_id_foreign');
            $table->dropForeign('admin_users_music_style_music_style_id_foreign');
        });
    }
}
