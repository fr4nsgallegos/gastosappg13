import 'package:gastosappg13/models/nota_model.dart';
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

  // INSERTAR
  Future<void> insertarNota(String titulo, String contenido) async {
    final db = await initDB();
    await db.insert("NOTAS", {"titulo": titulo, "contenido": contenido});
  }

  Future<void> insertarNotaModel(NotaModel notaModel) async {
    final db = await initDB();
    await db.insert("NOTAS", notaModel.toMap());
  }

  // OBTENER
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

  Future<List<NotaModel>> obtenerNotasModel() async {
    final db = await initDB();
    List<Map<String, dynamic>> data = await db.query("NOTAS");
    List<NotaModel> notasModelList = data
        .map((e) => NotaModel.fromMap(e))
        .toList();
    return notasModelList;
  }

  //ACTUALIZAR
  Future<void> actualizarNota(int id, String nuevoContenido) async {
    final db = await initDB();
    await db.update(
      "NOTAS",
      {"contenido": nuevoContenido},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // ELIMINAR
  Future<void> eliminarGasto(int id) async {
    final db = await initDB();
    await db.delete("NOTAS", where: "id=?", whereArgs: [id]);
  }
}
