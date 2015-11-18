<?php

namespace perfectTime\Http\Controllers;

use Illuminate\Http\Request;

use perfectTime\Http\Requests;
use perfectTime\Http\Controllers\Controller;
use Illuminate\Routing\Route;
use perfectTime\Proveedor;

class ProveedorController extends Controller
{

  public function __construct() {
    $this->middleware('cors');
    $this->beforeFilter('@find', ['only' => 'show', 'update', 'destroy']);
  }

  public function find(Route $route) {
    $this->proveedor = Proveedor::find($route->getParameter('proveedores'));
  }

    public function index()
    {
      $proveedor = Proveedor::all();
      return response()->json($proveedor->toArray());
    }
    public function create()
    {
        //
    }
    public function store(Request $request)
    {
        Proveedor::create($request->all());
        return response()->json(['mensaje' => "Proveedor creado"]);
    }
    public function show($id)
    {
        return response()->json($this->proveedor);
    }
    public function edit($id)
    {
        //
    }
    public function update(Request $request, $id)
    {
        $this->proveedor->fill($request->all());
        $this->proveedor->save();
        return response()->json(['mensaje' => 'Proveedor actualizado']);
    }
    public function destroy($id)
    {
        $this->proveedor->delete();
        return response()->json(['mensaje' => 'Proveedor eliminado']);
    }
}
