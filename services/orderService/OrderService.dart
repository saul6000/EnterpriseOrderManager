import 'dart:io';

import '../../model/Client.dart';
import '../../model/Order.dart';
import '../../model/Product.dart';
import '../../repository/Repository.dart';
import '../../repository/RepositoryClients.dart';
import '../../repository/RepositoryOrder.dart';
import '../../repository/RepositoryProducts.dart';
import '../Conditions.dart';

class Orderservice {
  final Repository _repository = RepositoryOrder();
/////////////////////////////////////////////////////////////////////////////
  //Imprimir la petición con id usado para esta misma clase para
  //mostrar en la funcion de actualización el objeto a modificar.
  void printOrderWithId(String id) {
    print("Ingresa el id de la petición que estas buscando");
    Order refOrder = _repository.read(id);
    print({
      "${refOrder.id}": {
        "Cliente": {
          "Id del cliente":refOrder.client.id,
          "Nombre del cliente": refOrder.client.name,
          "Tipo de cliente": refOrder.client.clientType.name,
        },
        "Products": {
          () => {
            for (var properties in refOrder.products)
              {
                print({
                  "Id":properties.id,
                  "Nombre del producto": properties.name,
                  "Precio": properties.price,
                }),
              },
          },
        },
        "Cantidad": refOrder.quantities,
        "Estado de la orden": refOrder.stateOrder,
        "Emisión de la orden": refOrder.date,
      },
    });
  }
///////////////////////////////////////////////////////////////////////////////
  //Mostrar un producto
  void readProduct() {
    print("Ingrese el id de la peticion que esta buscando");
    String? id = stdin.readLineSync()!;
    print("\n");
    Order? refOrder = _repository.read(id);
    if (refOrder == null) {
      print("No existe la peticion");
      return;
    }
    print({
      "${refOrder.id}": {
        "Cliente": {
          "Id del cliente": refOrder.client.id,
          "Nombre del cliente": refOrder.client.name,
          "Correo del cliente": refOrder.client.email,
          "Tipo de cliente": refOrder.client.clientType.name,
        },
        "Products": {
          () => {
            for (var properties in refOrder.products)
              {
                print({
                  "Id del producto": properties.id,
                  "Nombre del producto": properties.name,
                  "Precio del producto": properties.price,
                  "Stock del producto": properties.stock,
                }),
              },
          },
        },
        "Cantidad": refOrder.quantities,
        "Estado de la orden": refOrder.stateOrder,
        "Emisión de la orden": refOrder.date,
      },
    });
    print("\n");
  }
////////////////////////////////////////////////////////////////////////////////////////////
  //Mostrar todas las peticiones
  void readAllOrders() {
    print("\n");
    _repository.readAll();
    print("\n");
  }
/////////////////////////////////////////////////////////////////////////////////////////////
  //Agregar una peticion
  void addOrder(String id) {
    print("Ingrese los datos de la petición");
    print("Ingrese el id del cliente que hace la peticion");
    Client? client = RepositoryClients.clients[id];
    if (client == null) {
      print("No existe el tipo de cliente");
      return;
    }
    bool condition = true;
    List<Product> addProducts = [];

    print("Ingresa el id del producto que va pedir el cliente");
    String? idProduct = stdin.readLineSync();
    _foundProduct(id, addProducts: addProducts);
    while (Conditions.changeACamp(
      "Ingresa si o no si quieres agregar otro producto",
    )) {
      print("Ingresa el id del producto");
      idProduct = stdin.readLineSync();
      _foundProduct(id, addProducts: addProducts);
    }
    print("Ingresa la cantidad de producto pedido");
    int? quantities = int.tryParse(stdin.readLineSync()!);
    if(quantities ==null){
      print("Cantidad no valida de stock");
      return;
    }
    
  }

  /////////////////////////////////////////////////////////////////////////////////
  //Condicion que ve si el producto existe o no

  _foundProduct(String id,{required List<Product> addProducts}) {
    if (RepositoryProducts.products[id] == null) {
      print("No existe ese producto");
      return;
    }
    addProducts.add(RepositoryProducts.products[id]);
  }
}
