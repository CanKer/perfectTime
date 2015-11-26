(function() {
  'use strict';

  angular.module('Bookmarks', [
    'ngResource'
  ])

  .factory('Producto', function($resource) {
    return $resource('http://localhost:8000/productos/:id', {
      id: '@id'
    }, {
      update: {
        method: 'PUT'
      }
    });
  })


  .factory('Categoria', function($resource) {
    return $resource('http://localhost:8000/categorias/:id');
  })

  .factory('Almacen', function($resource) {
    return $resource('http://localhost:8000/almacenes/:id');
  })

  .factory('Proveedor', function($resource) {
    return $resource('http://localhost:8000/proveedores/:id');
  })

  .controller('MainController', function($scope, Producto, Categoria, Almacen,  Proveedor) {
    $scope.name = "CanKer";
    $scope.categorias = ['1', '2', '3', '4'];


    $scope.productos = Producto.query();
    $scope.categoriastl = Categoria.query();
    $scope.almacenes = Almacen.query();
    $scope.proveedores = Proveedor.query();

    $scope.menus = [{
      id: 1,
      nombre: 'Productos',
      categorias: [{
        id: 1,
        nombre: 'Collares'
      }, {
        id: 2,
        nombre: 'Broches'
      }, {
        id: 3,
        nombre: 'Brazaletes'
      }, {
        id: 4,
        nombre: 'Aretes'
      }, {
        id: 5,
        nombre: 'Tiaras'
      }, {
        id: 6,
        nombre: 'Peinetas'
      }, {
        id: 7,
        nombre: 'Pasadores'
      }, {
        id: 8,
        nombre: 'Pulceras'
      }, ]
    }, {
      id: 2,
      nombre: 'Proveedores'
    }, {
      id: 3,
      nombre: 'Almacenes'
    }, {
      id: 4,
      nombre: 'Clientes'
    }, {
      id: 5,
      nombre: 'Categorias'
    }, {
      id: 6,
      nombre: 'Usuarios'
    }];







    $scope.currentCategory = "";

    $scope.setCurrentCategory = function(category) {
      $scope.currentCategory = category;
    };

    $scope.isCurrentCategory = function(category) {
        //    console.log($scope.currentCategory === category);
        return $scope.currentCategory === category;
      }
      //    console.log(currentCategory);

    $scope.save = function(producto) {
      //  console.log(producto);
      //console.log(producto.url);

      if ($scope.productoForm.$valid) {
        if (!producto.id) {
          var prod = new Producto();

          prod.nombre = producto.nombre;
          prod.descripcion = producto.descripcion;
          prod.categoria = producto.categoria;
          prod.precioPublico = producto.precioPublico;
          prod.precioCompra = producto.precioCompra;
        //  prod.img = producto.img;   <-- pendiente de implementar
          prod.proveedor = producto.proveedor;
          prod.almacen = producto.alamacen;


          prod.$save(function(response) {
            $scope.productos.push(prod);
          });

            Producto.$save(producto);
        }
        $('#productoModal').modal('hide');
      } else {
        producto.update(producto);
      }

    }

    $scope.showWindow = function(producto) {
      $scope.productoForm.$setPristine();
      $scope.productoForm.$setUntouched();

      //    producto = producto || {
      //      categorias: $scope.currentCategory
      //    };
      $scope.producto = producto;
      $('#productoModal').modal('show');
    }


    $scope.remove = function(id) {
      for (var i = 0; i < $scope.productos.length; i++) {
        if ($scope.productos[i].id === id) {
          $scope.productos.splice(i, 1);
          break;
        }
      }
    }


  });

})();
