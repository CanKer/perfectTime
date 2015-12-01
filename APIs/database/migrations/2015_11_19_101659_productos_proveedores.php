<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ProductosProveedores extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos_proveedores', function (Blueprint $table) {
          $table->unsignedInteger('producto');
          $table->unsignedInteger('proveedor');

          $table->primary(['producto', 'proveedor']);

          $table->timestamps();
      });

      Schema::table('productos_proveedores', function($table) {
        $table->foreign('producto')->references('id')->on('productos');
        $table->foreign('proveedor')->references('id')->on('proveedores');
      });
  }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('productos_proveedores');
    }
}
