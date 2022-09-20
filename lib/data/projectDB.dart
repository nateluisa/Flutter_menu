import 'package:flutter_project2/dao/banks_dao.dart';
import 'package:flutter_project2/model/banks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<Database> createDatabase() async {
  return openDatabase(
    join(
      await getDatabasesPath(),
      'project.db',
    ),
    onCreate: (db, version) {
      return db.execute(BanksDao.tableSql);
    },
    version: 1,
     // onDowngrade: onDatabaseDowngradeDelete, para limpeza do banco faça upgrade em +1 na versao + hot restart logo depois volte 1 versao e comente esse trecho novamente + hot restart
  );
}




