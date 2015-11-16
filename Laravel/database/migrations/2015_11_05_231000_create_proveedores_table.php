<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProveedoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proveedores', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->string('RFC');
            $table->string('email')->unique();
            $table->string('telefono');
            $table->string('calle');
            $table->string('numE');
            $table->string('numbI');
            $table->string('colonia');
            $table->string('ciudad');
            $table->string('cp');
            $table->string('estado');
            $table->string('pais');

            $table->SoftDeletes();
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
        Schema::drop('proveedores');
    }
}
