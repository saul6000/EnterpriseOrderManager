abstract class Repository {
  //Agregar 
  void add(String id,dynamic object);
  //Actualizar
  void update(String id,dynamic product);
  //Eliminar
  void delete(String id);
  //Leer
  dynamic read(String id);
  //LeerTodo
  void readAll();
}