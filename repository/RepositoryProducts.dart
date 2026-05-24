
import '../model/Product.dart';
import 'Repository.dart';

class RepositoryProducts extends Repository {
  static Map<String, Product> _products = {};
  static get products => _products;
  void add(String id, dynamic product) {
    if (product is Product) _products.putIfAbsent(id, () => product);
  }

  @override
  void delete(String id) {
    _products.remove(id);
  }

  Product? read(String id) {
    return _products[id];
  }

  @override
  void readAll() {
    _products.forEach(
      (key, value) => print({
        key: {
          "id:": value.id,
          "name": value.name,
          "price": value.price,
          "stock": value.stock,
        },
      }),
    );
  }

  @override
  void update(String id, dynamic product) {
    if (product is Product) {
      _products[id] = product;
    } else {}
  }
}
