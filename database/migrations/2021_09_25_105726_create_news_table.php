<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('news', function (Blueprint $table) {
            $table->increments('id');
            $table->date('end_date')->nullable();
            $table->string('title');
            $table->longText('text');
            $table->unsignedInteger('created_by')->index('news_created_by_foreign');
            $table->unsignedInteger('updated_by')->nullable()->index('news_updated_by_foreign');
            $table->tinyInteger('show_item')->default(0);
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
        Schema::dropIfExists('news');
    }
}
