import 'dart:io';

import '../../model/Product.dart';
import '../../repository/RepositoryProducts.dart';
import '../Conditions.dart';

class ProductService {
  final RepositoryProducts _repository = RepositoryProducts();
  //Imprimir el producto con id usado para esta misma clase para mostrar en
  //actualizacion el objeto a modificar
  void printProductWithId(String id) {
    print("Ingresa el id del producto que estas buscando");
    Product? refProduct = _repository.read(id)!;
    print({
      "${refProduct.id}": {
        "id": refProduct.id,
        "name": refProduct.name,
        "price": refProduct.price,
        "stock": refProduct.stock,
      },
    });
    print("\n");
  }

  //Mostrar un producto
  void readProduct() {
    print("Ingresa el id del producto que estas buscando");

    String? id = stdin.readLineSync()!;
     print("\n");
    var refProduct = _repository.read(id)!;
    print({
      "${refProduct.id}": {
        "id": refProduct.id,
        "name": refProduct.name,
        "price": refProduct.price,
        "stock": refProduct.stock,
      },
    });
    print("\n");
  }

  //Mostrar todos los productos
  void readAllProducts() {
     print("\n");
    _repository.readAll();
    print("\n");
  }

  //Agregar un producto
  void addProduct(String id) {
    print("Ingrese los datos del producto");
    print("Ingrese el nombre");
    String? name = stdin.readLineSync() ?? " ";
    print("Ingrese el precio");
    double price = double.parse(stdin.readLineSync() ?? "0.0");
    print("Ingrese el stock");
    int stock = int.parse(stdin.readLineSync() ?? "0");
    _repository.add(
      id,
      Product(id: id, name: name, price: price, stock: stock),
    );
     print("\n");
    print("Agregaste un producto\n");
  }

  //Actualizar un producto
  void updateProduct() {
    print("Ingresa el id del producto que vas actualizar");
    String? id = stdin.readLineSync() ?? "valor no valido!!!";

    var refProduct = _repository.read(id);
    if (refProduct == null) {
      print("Producto no encontrado");
      return;
    }
    print("Elija que quiere cambiar del producto");
    //Se imprime el objeto en este caso producto antes de ser modificado
     print("\n");
    printProductWithId(id);
    if (Conditions.changeACamp(
      "\nEscriba si o no para cambiar el nombre del producto",
    )) {
      print("Ingresa el nuevo nombre del producto");
      String? newName = stdin.readLineSync();

      if (!Conditions.isEmptyProperty(newName, "No ingresaste un nombre!!!")) {
        refProduct.name = newName!;
      }
    }
    if (Conditions.changeACamp(
      "Escriba si o no para cambiar el precio del producto",
    )) {
      print("Ingrese el nuevo precio");
      double? price = double.tryParse(stdin.readLineSync() ?? "");
      if (Conditions.isNullDouble(price, "Precio invalido")) {
        refProduct.price = price!;
      }
    }
    if (Conditions.changeACamp(
      "Escriba si o no para cambiar el stock del producto",
    )) {
      print("Ingrese el nuevo stock");
      int? stock = int.tryParse(stdin.readLineSync() ?? "");
      if (Conditions.isNullInt(stock, "Stock no valido")) {
        refProduct.stock = stock!;
      }
    }

    _repository.update(id, refProduct);
    print("Producto actualizado\n");
  }

  //Eliminar un producto
  void deleteProduct() {
    print("Ingresa el id del producto a eliminar");
    String? id = stdin.readLineSync();
       if(id==null || id.isEmpty){
      print("Id no valido");
      return;
    }
    if (_repository.read(id) !=null) {
     _repository.delete(id);
     print("Producto eliminado\n");
      return;
    }
     print("\n");
    print("Producto no eliminado\n");
    return;
  }

  static int i = 0;
  static String generateId() {
    i++;
    return "P[${i}]";
  }
}

void main() {
  int condition = 0;
  var product = ProductService();
  do {
    print("Elija la opcion a realizar");
    print("1. Crear un producto");
    print("2. Ver todo los productos");
    print("3. Ver un producto");
    print("4. Actualizar un producto");
    print("5. Eliminar un producto");
    condition = int.parse(stdin.readLineSync() ?? "12");
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
      default:
        print("");
    }
  } while (condition != 9);
}
