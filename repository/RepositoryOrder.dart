import '../model/Order.dart';
import 'Repository.dart';

class RepositoryOrder extends Repository {
  final Map<String, Order> _orders = {};

  @override
  void add(String id, dynamic order) {
    this._orders.putIfAbsent(id, () => order);
  }

  @override
  void delete(String id) {
    this._orders.remove(id);
  }

  @override
  Order? read(String id) {
    return this._orders[id];
  }

  @override
  void readAll() {
    this._orders.forEach(
      (key, value) => print({
        key: {
          "Cliente": {"Nombre del cliente": value.client.name},
          "Products": {
            () => {
              for (var properties in value.products)
                {
                  print({"Nombre del producto": properties.name}),
                },
            },
          },
          "Cantidad": value.quantities,
          "Estado de la orden": value.stateOrder,
          "Emisión de la orden": value.date,
        },
      }),
    );
  }

  @override
  void update(String id, dynamic order) {
    if (order is Order) {
      this._orders[id] = order;
    }
  }
}
