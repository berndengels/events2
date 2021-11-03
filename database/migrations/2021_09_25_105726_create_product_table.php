<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->text('description');
            $table->decimal('price')->unsigned();
            $table->double('price_netto')->unsigned();
            $table->tinyInteger('is_published')->default(0);
            $table->tinyInteger('is_available')->default(0);
            $table->unsignedInteger('created_by')->index('product_created_by_foreign');
            $table->unsignedInteger('updated_by')->nullable()->index('product_updated_by_foreign');
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
        Schema::dropIfExists('product');
    }
}
