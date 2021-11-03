<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminUsersMusicStyleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admin_users_music_style', function (Blueprint $table) {
            $table->unsignedInteger('admin_user_id');
            $table->unsignedInteger('music_style_id')->index('admin_users_music_style_music_style_id_foreign');
            $table->primary(['admin_user_id', 'music_style_id']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admin_users_music_style');
    }
}
