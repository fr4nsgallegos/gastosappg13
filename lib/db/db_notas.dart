import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class NotasDatabase {
  Future<Database> initDB() async {
    final pathDb = await getDatabasesPath();
    final path = join(pathDb, "notas.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE NOTAS(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, contenido TEXT)",
        );
      },
    );
  }
}
