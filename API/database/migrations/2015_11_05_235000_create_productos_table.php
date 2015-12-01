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

            $table->unsignedInteger('categoria');
            $table->unsignedInteger('proveedor');
            $table->unsignedInteger('almacen');


            $table->SoftDeletes();
            $table->timestamps();
        });

        Schema::table('productos', function($table) {
          $table->foreign('categoria')->references('id')->on('categorias');
          $table->foreign('proveedor')->references('id')->on('proveedores');
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
        Schema::drop('productos');
    }
}
