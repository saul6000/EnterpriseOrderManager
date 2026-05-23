import 'Client.dart';
import 'Product.dart';
import 'StateOrder.dart';

class Order{
  String _id;
  Client _client;
  List<Product> _products;
  double _quantities;
  DateTime _date;
  StateOrder _stateOrder;

  //Getters
  Client get client=>this._client;
  List<Product> get products=>this._products;
  double get quantities=>this._quantities;
  StateOrder get stateOrder=>this._stateOrder;
  DateTime get date=>this._date;
  String get id=>this._id;
  //Setters
  void set client(Client cliente)=>this._client=cliente;
  void set products(Product product)=>this._products.add(product);
  void set quantities(double quantities)=>this._quantities=quantities;
  void set stateOrder(StateOrder stateOrder)=>this._stateOrder=stateOrder;
  void set date(DateTime date)=>this._date=date;
  void set id(String id) =>this._id=id;
  Order({id,client,products,quantities,date,stateOrder}): 
  this._client=client,
  this._products=products,
  this._quantities=quantities,
  this._date=date,
  this._stateOrder=stateOrder,
  this._id=id;
  void calcualteTotal(){
      
  }
  void applyDiscount(){

  }
  void confirmPayment(){

  }
  void cancelOrder(){

  }
}