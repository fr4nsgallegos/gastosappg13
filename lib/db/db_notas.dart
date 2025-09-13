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

  Future<void> insertarNota(String titulo, String contenido) async {
    final db = await initDB();
    await db.insert("NOTAS", {"titulo": titulo, "contenido": contenido});
  }

  Future<List<Map<String, dynamic>>> obtenerNotas() async {
    final db = await initDB();
    // return db.rawQuery(
    //   "SELECT id, contenido FROM NOTAS WHERE titulo='Compras de la semana'",
    // );

    return db.query(
      "NOTAS",
      where: "titulo = 'Compras de la semana'",
      columns: ["id", "contenido"],
    );
    // return db.query("NOTAS");
  }
}
