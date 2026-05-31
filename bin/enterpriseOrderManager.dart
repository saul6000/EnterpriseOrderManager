import 'dart:io';

import '../view/viewProduct/ViewProduct.dart';
import '../view/viewClient/ViewClient.dart';

void main() {
  int? choice;
  do {
    print("Elija la operación que quiere realizar");
    print("1. Productos");
    print("2. Clientes");
    print("3. Registrar Cliente");
    print("4. Crear Pedidos");
    print("5. Obtener ventas totales");
    print("6. Obtener Productos mas vendidos");
    print("7. Exportar Reporte");
    print("8. Salir");
    choice = int.tryParse(stdin.readLineSync()!);
    if (choice == null) {
      print("Opcion no valida");
      continue;
    }
    switch (choice) {
      case 1:
        ViewProduct.optionsProduct();
        break;
      case 2:
        ViewClient.optionsClient();
        break;
      case 8:
        print("Gracias por usar nuestro servicio!!!");
        break;
    }
  } while (choice != 8);
}

void addProduct(String generateId) {}

