class Product {
  String _id;
  String _name;
  double _price;
  int _stock;

  Product({required id, required name, required price, required stock})
    : _id = id,
      _name = name,
      _price = price,
      _stock = stock;
  //Getters
  String get id => this._id;
  String get name => this._name;
  double get price => this._price;
  int get stock => this._stock;
  //Setters
  void set id(String id) => this._id = id;
  void set name(String name) => this._name = name;
  void set stock(int stock) => this._stock = stock;
  void set price(double price) => this._price = price;
}
