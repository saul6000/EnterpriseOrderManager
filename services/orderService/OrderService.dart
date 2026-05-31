import 'dart:io';

import '../../model/Client.dart';
import '../../model/Order.dart';
import '../../model/Product.dart';
import '../../model/StateOrder.dart';
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
          "Id del cliente": refOrder.client.id,
          "Nombre del cliente": refOrder.client.name,
          "Tipo de cliente": refOrder.client.clientType.name,
        },
        "Products": {
          () => {
            for (var properties in refOrder.products)
              {
                print({
                  "Id": properties.id,
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
  void addOrder() {
    Order refOrder = Order();
    print("Ingrese los datos de la petición");
    print("Ingrese el id del cliente que hace la peticion");
    String? idClient = stdin.readLineSync();
    if (idClient == null) {
      print("El id del cliente no es valido");
      return;
    }
    Client? client = RepositoryClients.clients[idClient];
    if (client == null) {
      print("No existe el cliente");
      return;
    }
    refOrder.client = RepositoryClients.clients[idClient];
    print("Ingresa el id del producto");
    String? idProduct = stdin.readLineSync();
    if (idProduct == null) {
      print("El id del producto no es valido!!!");
    }
    if (_foundProduct(idProduct)) {
      print("El producto no existe");
      return;
    }
    refOrder.products = RepositoryProducts.products[idProduct];

    int? quantities = int.tryParse(stdin.readLineSync()!);
    if (quantities == null) {
      print("La cantidad no es valida!!!");
      return;
    }
    if (quantities > RepositoryProducts.products[idProduct].stock) {
      print("La cantidad excede el limite de stock");
      quantities = 0;
      return;
    }
    refOrder.quantities = quantities;
    refOrder.date = DateTime.now();
    print("Ingrese el estado del pedido (earring, paid, sent, canceled)");
    String? stateOrder = stdin.readLineSync();
    if (stateOrder == null) {
      print("El estado del pedido no es valido!!!");
      return;
    }
    if (_whatIsTypeStateOrder(stateOrder) == 0) {
      return;
    }
    refOrder.stateOrder = StateOrder.values.byName(stateOrder);
    print("Pedido guardado exitosamente!!!");
  }

  /////////////////////////////////////////////////////////////////////////////////
  //Condicion que ve si el producto existe o no

  _foundProduct(String? id) {
    if (RepositoryProducts.products[id] == null) {
      return true;
    }
    return false;
  }

  _whatIsTypeStateOrder(String type) {
    for (var typeB in StateOrder.values) {
      if (typeB.name.compareTo(type) == 0) {
        return typeB.name;
      }
    }
    print("No existe ese tipo de estado del pedio");
    print("Ingrese uno valido");
    return 0;
  }
}
