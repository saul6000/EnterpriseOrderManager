 
 import 'dart:io';

class Conditions {
    //Cambios para actualizar
  static bool changeACamp(String message){
    print(message);
    String? phrase = stdin.readLineSync();
    if(phrase?.toLowerCase()=="si"){
      return true;
    }
     if(phrase?.toLowerCase()=="no"){
      return false;
    }
    return false;
  }
  //Funcion que sirve para ver si un string esta vacio 
  static bool isEmptyProperty(String? property,String message){
    if(property!=null){
      if(property.isEmpty){
        print(message);
        return true;
      }
    }
    return false;
  }

  //Funcion que sirve para ver si un double es null
  static bool isNullDouble(double? count,String message){
      if(count !=null){
          return true;
      }
      print(message);
      return false;
  }

  //Funcion que sirve para ver si un int es null
  static bool isNullInt(int? count,String message){
    if(count!=null){
      return true;
    }
    print(message);
    return false;
  }
 
 }
