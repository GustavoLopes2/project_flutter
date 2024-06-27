import 'package:path/path.dart';
import 'package:projeto_flutter/app/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(insert);
          db.execute(insert1);
          db.execute(insert2);
        },
      );
    }
    return _db!;
  }
}
