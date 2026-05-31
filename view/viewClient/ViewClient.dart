import 'dart:io';

import '../../services/clientService/ClientService.dart';

class ViewClient {
  static void optionsClient() {
    int? option;
    ClientService _clientService = ClientService();
    do {
      print("---------Clientes--------");
      print("Elija la opcion a realizar");
      print("1. Agregar un cliente");
      print("2. Mostrar toda la lista de clientes");
      print("3. Mostrar un cliente");
      print("4. Actualizar un cliente");
      print("5. Eliminar un cliente");
      option = int.tryParse(stdin.readLineSync()!);
      if (option == null) {
        print("Opcion no valida!!!");
        return;
      }
      switch (option) {
        case 1:
          _clientService.addClient();
          break;
        case 2:
          _clientService.readAllClients();
          break;
        case 3:
          _clientService.readClient();
          break;
        case 4:
          _clientService.updateClient();
          break;
        case 5:
          _clientService.deleteClient();
          break;
        case 6:
          option = 6;
        default:
          print("Opcion no valida!!!");
      }
    } while (option != 6);
  }
}
