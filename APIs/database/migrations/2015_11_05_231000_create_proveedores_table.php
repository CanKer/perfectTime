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

            $table->unsignedInteger('domicilio');

            $table->SoftDeletes();
            $table->timestamps();
        });

        Schema::table('proveedores', function($table) {
          $table->foreign('domicilio')->references('id')->on('domicilios');
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
