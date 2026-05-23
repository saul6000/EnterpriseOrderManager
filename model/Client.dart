import 'ClientType.dart';

class Client{
  String _id;
  String _name;
  String _email;
  ClientType _clientType;
  Client({id,name,email,clientType}):
  this._id=id,
  this._name=name,
  this._email=email,
  this._clientType=clientType;
  
  //Getters 
  String get id=> this._id;
  String get name=> this._name;
  String get email=> this._email;
  ClientType get clientType=> this._clientType;
  
  //Setters
  void set id(String id) => this._id=id;
  void set name(String name) => this._name=name;
  void set email(String email) => this._email=email;
  void set clientType(ClientType _clientType) => this._clientType=_clientType;

}