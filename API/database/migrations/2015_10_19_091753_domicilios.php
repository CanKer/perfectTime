<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Domicilios extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('domicilios', function (Blueprint $table) {
            $table->increments('id');

            $table->string('calle');
            $table->string('numE');
            $table->string('numI');
            $table->string('colonia');
            $table->string('cp');
            $table->string('ciudad');
            $table->string('estado');
            $table->string('pais');
            $table->string('telefono');

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
        Schema::drop('domicilios');
    }
}
