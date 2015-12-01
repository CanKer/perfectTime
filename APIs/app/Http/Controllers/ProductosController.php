<?php

namespace perfectTime\Http\Controllers;

use Illuminate\Http\Request;

use perfectTime\Http\Requests;
use perfectTime\Http\Controllers\Controller;
use Illuminate\Routing\Route;
use perfectTime\Producto;

class ProductosController extends Controller
{

  public function __construct() {
    $this->middleware('cors');
    $this->beforeFilter('@find', ['only' => 'show', 'update', 'destroy']);
  }

  public function find(Route $route)  {
    $this->producto = Producto::find($route->getParameter('productos'));
  }

    public function index()
    {
        $producto = Producto::all();
        return response()->json($producto->toArray());
    }

    public function create()
    {

    }

    public function store(Request $request)
    {
        Producto::create($request->all());
        return response()->json(["mensaje" => "Producto creado"]);
    }

    public function show($id)
    {
        return response()->json($this->producto);
    }

    public function edit($id)
    {

    }

    public function update(Request $request, $id)
    {
        $this->producto->fill($request->all());
        $this->producto->save();
        return response()->json(["mensaje" => "Producto actualizado"]);
    }

    public function destroy($id)
    {
        $this->producto->delete();
        return response()->json(["mensaje" => "Producto borrado"]);
    }
}
