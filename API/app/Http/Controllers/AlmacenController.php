<?php

namespace perfectTime\Http\Controllers;

use Illuminate\Http\Request;

use perfectTime\Http\Requests;
use perfectTime\Http\Controllers\Controller;
use Illuminate\Routing\Route;
use perfectTime\Almacen;

class AlmacenController extends Controller
{

  public function __construct() {
    $this->middleware('cors');
    $this->beforeFilter('@find', ['only' => 'show', 'update', 'destroy']);
  }

  public function find(Route $route) {
    $this->almacen = Almacen::find($route->getParameter('almacenes'));
  }

    public function index()
    {
      $almacen = Almacen::all();
      return response()->json($almacen->toArray());
    }
    public function create()
    {
        //
    }
    public function store(Request $request)
    {
        Almacen::create($request->all());
        return response()->json(['mensaje' => "Almacén creado"]);
    }
    public function show($id)
    {
        return response()->json($this->almacen);
    }
    public function edit($id)
    {
        //
    }
    public function update(Request $request, $id)
    {
        $this->almacen->fill($request->all());
        $this->almacen->save();
        return response()->json(['mensaje' => 'Almacén actualizado']);
    }
    public function destroy($id)
    {
        $this->almacen->delete();
        return response()->json(['mensaje' => 'Almacén eliminado']);
    }
}
