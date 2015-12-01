<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ProductosAlmacenes extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos_almacenes', function (Blueprint $table) {

            $table->unsignedInteger('producto');
            $table->unsignedInteger('almacen');

            $table->primary(['producto', 'almacen']);

            $table->timestamps();
        });

        Schema::table('productos_almacenes', function($table) {
          $table->foreign('producto')->references('id')->on('productos');
          $table->foreign('almacen')->references('id')->on('almacenes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('productos_almacenes');
    }
}
