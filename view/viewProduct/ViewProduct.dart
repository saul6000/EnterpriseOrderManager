import 'dart:io';

import '../../services/productService/ProductService.dart';

class ViewProduct {
  static void optionsProduct(){
  int? condition;
  var product = ProductService();
  do {
    print("Elija la opcion a realizar");
    print("1. Crear un producto");
    print("2. Ver todo los productos");
    print("3. Ver un producto");
    print("4. Actualizar un producto");
    print("5. Eliminar un producto");
    print("6. Regresar");
    condition = int.tryParse(stdin.readLineSync()!);
    if(condition==null){
      print("valor no valido");
      return;
    }
    switch (condition) {
      case 1:

        product.addProduct(ProductService.generateId());
        break;
      case 2:
        product.readAllProducts();
        break;
      case 3:
        product.readProduct();
        break;
      case 4:
        product.updateProduct();
        break;
      case 5:
        product.deleteProduct();
        break;
      case 6:return;
      default: 
        print("Opcion no encontrada");
    }
  } while (condition != 6);
  }
}