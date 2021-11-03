<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToProductStockTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('product_stock', function (Blueprint $table) {
            $table->foreign('product_id')->references('id')->on('product')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign('product_size_id')->references('id')->on('product_size')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_stock', function (Blueprint $table) {
            $table->dropForeign('product_stock_product_id_foreign');
            $table->dropForeign('product_stock_product_size_id_foreign');
        });
    }
}
