<?php

namespace perfectTime;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Producto extends Model
{
  use SoftDeletes;

    protected $table = 'productos';
    protected $fillable = ['nombre', 'descripcion', 'precioPublico', 'precioCompra', 'img', 'id_categoria', 'id_proveedor', 'id_almacen'];

    protected $dates = ['deleted_at'];
}
