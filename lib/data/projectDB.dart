import 'package:flutter_project2/model/banks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'project.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE banks ('
          'id INTERGER PRIMARY KEY,'
          'name TEXT, '
          'account_number INTERGER,'
          'agency_number INTERGER');
    }, version: 1);
  });
}

Future<int> save(Bank bank) {
  return createDataBase().then((db) {
    final Map<String, dynamic> bankMap = Map();
    bankMap['name'] = bank.name;
    bankMap['agency'] = bank.agency;
    bankMap['account'] = bank.account;
    return db.insert('banks', bankMap);
  });
}



Future<List> findAll() {
 return createDataBase().then((db) {
   return db.query('banks').then((maps) {
     final List<Bank> banks = [];
      for (Map<String, dynamic> map in maps) {
        final Bank bank = Bank(
          map['id'],
          map['name'],
          map['agency'],
          map['account'],
        );
        banks.add(bank);
      }
      return banks;
    });
  });
}
