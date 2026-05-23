import 'dart:async';
import 'dart:io';
import 'dart:math';

import '../../model/Client.dart';
import '../../model/ClientType.dart';
import '../../repository/Repository.dart';
import '../../repository/RepositoryClients.dart';
import '../Conditions.dart';
import '../productService/ProductService.dart';

class Clientservice {
  final Repository _repository = RepositoryClients();
  //Imprimir el producto con id usado para esta misma clase para mostrar en
  //actualizacion el objeto a modificar
  void printClientWithId(String id) {
    print("Ingresa el id del producto que estas buscando");
    Client refClient = _repository.read(id)!;
    print({
      "${refClient.id}": {
        "id": refClient.id,
        "name": refClient.name,
        "email": refClient.email,
        "type": refClient.clientType.name,
      },
    });
     print("\n");
  }

  //Mostrar un cliente
  void readClient() {
    print("Ingrese el id del cliente que estas buscando");
    String? id = stdin.readLineSync()!;
     print("\n");
    Client? refClient = _repository.read(id);
    if (refClient == null) {
      print("No existe ese cliente");
      return;
    }
    print({
      "${refClient.id}": {
        "id": refClient.id,
        "name": refClient.name,
        "email": refClient.email,
        "type": refClient.clientType.name
      },
    });
     print("\n");
  }

  //Mostrar todos los clientes
  void readAllClients() {
     print("\n");
    _repository.readAll();
  print("\n");
  }

  //Agregar un cliente
  void addClient(String id) {
    print("Ingrese los datos del cliente");
    print("Ingrese el nombre completo del cliente");
    String? name = stdin.readLineSync();
    if (name == null) {
      print("Ingrese el nombre es un campo obligatorio");
      return;
    }
    print("Ingrese el email");
    String? email = stdin.readLineSync() ?? "example@gmail.com";
    print("""Ingrese el tipo de cliente hay tres tipos de cliente a elegir
     (normal, premium y vip) """);
    String? typeStr = stdin.readLineSync();
    if (typeStr == null) {
      print("No ha ingresado ningun tipo de cliente");
      return;
    }
    ClientType type = ClientType.values.byName(_whatIsTypeClient(typeStr));
    _repository.add(
      id,
      Client(id: id, name: name, email: email, clientType: type),
    );
     print("\n");
     print("Agregaste un cliente");
  }

  //Actualizar un cliete
  void updateClient() {
    print("Ingrese el id del cliente que quiere modificar");
    String? id = stdin.readLineSync() ?? " ";
    Client? refClient = _repository.read(id);
    if (refClient == null) {
      print("Cliente no encontrado");
      return;
    }
    //Se imprime el objeto en este caso cada cliente antes de ser modificado
    print("\n");
    printClientWithId(id);
    if (Conditions.changeACamp(
      "\nEscriba si o no para cambiar el nombre del cliente",
    )) {
      print("Ingrese el nuevo nombre del cliente");
      String? newName = stdin.readLineSync();
      var refClient = _repository.read(id);
      if (!Conditions.isEmptyProperty(
        newName,
        "No ingresaste el nombre del cliente!!!",
      )) {
        refClient.name = newName!;
      }
    }
    if (Conditions.changeACamp(
      "Ingrese si o no para cambier el email del cliente",
    )) {
      print("Ingresa el nuevo email");
      String? email = stdin.readLineSync();
      if (!Conditions.isEmptyProperty(email, "No ingresaste el email")) ;
      {
        refClient.email = email!;
      }
    }
    if (Conditions.changeACamp(
      "Ingrese si o no para cambiar el tipo de cliente",
    )) {
      print("Ingrese el tipo de cliente (normal, premium y vip)");
      String? type = stdin.readLineSync();
      if (!Conditions.isEmptyProperty(
        type,
        "Ingrese un tipo de cliente no valido",
      )) {
        if (_whatIsTypeClientUpdate(type)) {
          refClient.clientType = ClientType.values.byName(type!);
        }
      }
    }
    _repository.update(id, refClient);
    print("Cliente actualizado\n");
  }

  //Eliminar un cliente 
  void deleteClient(){
    print("Ingresa el id del cliente a eliminar");
    String? id= stdin.readLineSync();
    if(id==null || id.isEmpty){
      print("Id no valido");
      return;
    }
    if(_repository.read(id)!=null){
      _repository.delete(id);
      print("Cliente eliminado");
      return;
    }
     print("\n");
    print("Cliente no eliminado");
    return;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //condicion de tipo de cliente como no es algo general lo pongo como una funcion local
  _whatIsTypeClient(String type) {
    for (var typeB in ClientType.values) {
      if (typeB.name.compareTo(type) == 0) {
        return typeB.name;
      }
    }
    print("No existe ese tipo de cliente");
    print("Agregado como tipo de cliente normal");
    return ClientType.normal.name;
  }

  //Condicion de tipo de cliente para actualizacion
  bool _whatIsTypeClientUpdate(String? type) {
    if (type != null) {
      if (type.isEmpty) {
        return false;
      }
      for (var typeB in ClientType.values) {
        if (typeB.name.compareTo(type) == 0) {
          return true;
        }
      }
    }
    return false;
  }
}
void main(){
   int condition = 0;
  var client = Clientservice();
  do {
    print("Elija la opcion a realizar");
    print("1. Crear un cliente");
    print("2. Ver todo los clientes");
    print("3. Ver un cliente");
    print("4. Actualizar un cliente");
    print("5. Eliminar un cliente");
    condition = int.parse(stdin.readLineSync() ?? "12");
    switch (condition) {
      case 1:
        client.addClient(ProductService.generateId());
        break;
      case 2:
        client.readAllClients();
        break;
      case 3:
        client.readClient();
        break;
      case 4:
        client.updateClient();
        break;
      case 5:
        client.deleteClient();
        break;
      default:
        print("");
    }
  } while (condition != 9);
}

