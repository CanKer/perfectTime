<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clientes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            $table->string('apellidoP');
            $table->string('apellidoM');
            $table->string('email')->unique();
            $table->string('RFC');

            $table->unsignedInteger('domicilio');
            $table->unsignedInteger('id_tipo_cliente');
            
            $table->SoftDeletes();
            $table->timestamps();
        });

        Schema::table('clientes', function($table)  {
          $table->foreign('id_tipo_cliente')->references('id')->on('tipo_clientes');
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
        Schema::drop('clientes');
    }
}
