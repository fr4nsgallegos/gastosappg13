import 'package:flutter/material.dart';
import 'package:gastosappg13/db/db_notas.dart';

class DbExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                NotasDatabase dbNotas = NotasDatabase();
                dbNotas.initDB();
              },
              child: Text("Crear db"),
            ),
            ElevatedButton(
              onPressed: () {
                NotasDatabase dbNotas = NotasDatabase();
                dbNotas.insertarNota(
                  "Tareas a realizar",
                  "tarea del curso de flutter, reparar la tv",
                );
              },
              child: Text("Insertar Nota"),
            ),
            ElevatedButton(
              onPressed: () async {
                NotasDatabase dbNotas = NotasDatabase();
                List<Map<String, dynamic>> notas = await dbNotas.obtenerNotas();
                print(notas);
              },
              child: Text("Obtener notas"),
            ),
          ],
        ),
      ),
    );
  }
}
