import 'package:flutter_project2/data/projectDB.dart';
import 'package:flutter_project2/model/banks.dart';
import 'package:sqflite/sqlite_api.dart';

class BanksDao {

  static final String tableSql = 'CREATE TABLE banks('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'agency INTERGER,'
      'account INTEGER)';

  Future<int> save(Bank bank) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> bankMap = {};
    bankMap['name'] = bank.name;
    bankMap['account'] = bank.account;
    bankMap['agency'] = bank.agency;

    return db.insert('banks', bankMap);

  }

  Future<List<Bank>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('banks');
    final List<Bank> banks = [];
    for (Map<String, dynamic> row in result) {
      final Bank bank =
      Bank(row['id'], row['name'], row['account'], row['agency']);
      banks.add(bank);
    }
    return banks;


  }

  Future<int> update(Bank bank) async {
      var instance;
      final db = await instance.database;
    return db.update (

    );
  }

  Future<void> deleteBank(int id) async {
    final db = await createDatabase();

    await db.delete(
      'banks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}