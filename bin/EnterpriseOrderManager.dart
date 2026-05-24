import 'dart:io';

import '../view/viewProduct/ViewProduct.dart';
void main(){
 int? choice;
  do{
    print("Elija la operación que quiere realizar");
    print("1. Productos");
    print("2. Buscar Productos");
    print("3. Registrar Cliente");
    print("4. Crear Pedidos");
    print("5. Obtener ventas totales");
    print("6. Obtener Productos mas vendidos");
    print("7. Exportar Reporte");
    choice=int.tryParse(stdin.readLineSync()!);
    if(choice==null){
      print("Opcion no valida");
      return;
    }
    switch(choice){
      case 1: ViewProduct.optionsProduct();
      case 9:print("Gracias por usar nuestro servicio!!!");
    }

  }while(choice!=9);
}
void addProduct(String generateId){
  
}