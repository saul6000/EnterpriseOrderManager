import '../model/Client.dart';
import 'Repository.dart';

class RepositoryClients extends Repository {
  static final Map<String, Client> _clients = {};
  static get clients => _clients;

  @override
  void add(String id, dynamic client) {
    _clients.putIfAbsent(id, () => client);
  }

  @override
  void delete(String id) {
    _clients.remove(id);
  }

  @override
  Client? read(String id) {
    return _clients[id];
  }

  @override
  void readAll() {
    _clients.forEach(
      (key, value) => print({
        key: {
          "id": value.id,
          "name": value.name,
          "email": value.email,
          "type": value.clientType.name,
        },
      }),
    );
  }

  @override
  void update(String id, dynamic client) {
    if (client is Client) {
      _clients[id] = client;
    }
  }
}
