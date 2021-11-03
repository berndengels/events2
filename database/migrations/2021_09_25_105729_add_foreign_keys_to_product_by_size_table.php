<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToProductBySizeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('product_by_size', function (Blueprint $table) {
            $table->foreign('product_id')->references('id')->on('product')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign('size_id')->references('id')->on('product_size')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_by_size', function (Blueprint $table) {
            $table->dropForeign('product_by_size_product_id_foreign');
            $table->dropForeign('product_by_size_size_id_foreign');
        });
    }
}
