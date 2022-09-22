import 'package:flutter_project2/data/projectDB.dart';
import 'package:flutter_project2/model/clients.dart';
import 'package:sqflite/sqlite_api.dart';

class ClientsDao {
  static final String tableSql = 'CREATE TABLE clients('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'adress TEXT, '
      'number INTEGER, '
      'district TEXT, '
      'telephone INTERGER)';


  Future<int> saveClient(Client client) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> clientMap = {};
    clientMap['name'] = client.name;
    clientMap['adress'] = client.adress;
    clientMap['number'] = client.number;
    clientMap['district'] = client.district;
    clientMap['telephone'] = client.telephone;

    return db.insert('clients', clientMap);
  }

  Future<List<Client>> findAllClients() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('clients');
    final List<Client> clients = [];
    for (Map<String, dynamic> row in result) {
      final Client client = Client(row['id'], row['name'], row['adress'],
          row['number'], row['district'], row['telephone']);
      clients.add(client);
    }
    return clients;
  }

  Future<List<Client>> updateClient() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('clients');
    final List<Client> clients = [];
    for (Map<String, dynamic> row in result) {
      final Client client = Client(row['id'], row['name'], row['adress'],
          row['number'], row['district'], row['telephone']);
      clients.toSet();
    }
    return clients;
  }

  Future<int> deleteClient(int id, columnId, clients) async {
    print(columnId);
    print(id);
    Database db = await clients.database;
    return await db.delete(clients, where: '$columnId = id');
  }

  deleteAll(clients) async {
    Database db = await clients.database;
    return await db.rawDelete("Delete * from $clients");
  }

  // Future<List<Client>> deleteClient() async {
  //   final Database db = await createDatabase();
  //   final List<Map<String, dynamic>> result = await db.query('clients');
  //   final List<Client> clients = [];
  //   for (Map<String, dynamic> row in result) {
  //     final Client client = Client(row['id'], row['name'], row['adress'],
  //         row['number'], row['district'], row['telephone']);
  //     clients.remove(client);
  //   }
  //   return clients;
  // }
}