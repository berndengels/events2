<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderItemTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_item', function (Blueprint $table) {
            $table->increments('id');
            $table->string('size', 10)->nullable();
            $table->unsignedInteger('quantity');
            $table->decimal('price_total')->unsigned();
            $table->unsignedInteger('product_id')->index('order_item_product_id_foreign');
            $table->unsignedInteger('order_id')->index('order_item_order_id_foreign');
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
        Schema::dropIfExists('order_item');
    }
}
