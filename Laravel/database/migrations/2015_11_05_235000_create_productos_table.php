<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->string('descripcion');
            $table->string('precioPublico');
            $table->string('precioCompra');
            $table->string('img');

            $table->string('categoria');
            $table->string('proveedor');
            $table->string('almacen');


            $table->SoftDeletes();
            $table->timestamps();
        });

        Schema::table('productos', function($table) {
          $table->foreign('categoria')->references('nombre')->on('categorias');
          $table->foreign('proveedor')->references('nombre')->on('proveedores');
          $table->foreign('almacen')->references('nombre')->on('almacenes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('productos');
    }
}
