<?php

namespace perfectTime\Http\Controllers;

use Illuminate\Http\Request;

use perfectTime\Http\Requests;
use perfectTime\Http\Controllers\Controller;
use Illuminate\Routing\Route;
use perfectTime\Categoria;

class CategoriasController extends Controller
{

  public function __construct() {
    $this->middleware('cors');
    $this->beforeFilter('@find', ['only' => 'show', 'update', 'destroy']);
  }

  public function find(Route $route) {
    $this->categoria = Categoria::find($route->getParameter('categorias'));
  }

    public function index()
    {
      $categoria = Categoria::all();
      return response()->json($categoria->toArray());
    }
    public function create()
    {
        //
    }
    public function store(Request $request)
    {
        Categoria::create($request->all());
        return response()->json(['mensaje' => "Categoria creada"]);
    }
    public function show($id)
    {
        return response()->json($this->categoria);
    }
    public function edit($id)
    {
        //
    }
    public function update(Request $request, $id)
    {
        $this->categoria->fill($request->all());
        $this->categoria->save();
        return response()->json(['mensaje' => 'Categoria actualizada']);
    }
    public function destroy($id)
    {
        $this->categoria->delete();
        return response()->json(['mensaje' => 'Categoria eliminada']);
    }
}
