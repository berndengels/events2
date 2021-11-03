<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order', function (Blueprint $table) {
            $table->increments('id');
            $table->decimal('price_total')->unsigned();
            $table->decimal('amount_received')->unsigned()->nullable();
            $table->decimal('porto')->unsigned()->nullable();
            $table->unsignedInteger('created_by')->index('order_created_by_foreign');
            $table->unsignedInteger('updated_by')->nullable()->index('order_updated_by_foreign');
            $table->dateTime('delivered_on')->nullable();
            $table->timestamps();
            $table->timestamp('paid_on')->nullable();
            $table->string('payment_id', 100)->nullable();
            $table->string('payment_provider', 10)->nullable();
            $table->dateTime('mail_to_shop')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order');
    }
}
