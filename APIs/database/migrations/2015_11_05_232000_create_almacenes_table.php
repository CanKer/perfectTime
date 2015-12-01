<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAlmacenesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('almacenes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->string('encargado');
            $table->string('email');

            $table->unsignedInteger('domicilio');

            $table->SoftDeletes();
            $table->timestamps();
        });
        Schema::table('almacenes', function($table)  {
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
        Schema::drop('almacenes');
    }
}
