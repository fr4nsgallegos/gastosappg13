import 'package:flutter/material.dart';
import 'package:gastosappg13/db/db_notas.dart';
import 'package:gastosappg13/models/nota_model.dart';

class DbExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     NotasDatabase dbNotas = NotasDatabase();
            //     dbNotas.initDB();
            //   },
            //   child: Text("Crear db"),
            // ),
            ElevatedButton(
              onPressed: () {
                // NotasDatabase dbNotas = NotasDatabase();
                // dbNotas.insertarNota(
                //   "Tareas a realizar",
                //   "tarea del curso de flutter, reparar la tv",
                // );
                NotasDatabase().insertarNota(
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
            ElevatedButton(
              onPressed: () async {
                NotasDatabase dbNotas = NotasDatabase();
                dbNotas.actualizarNota(
                  1,
                  "Comprar Leche, manzanas y mandarinas",
                );
              },
              child: Text("Actualizar la nota 1"),
            ),
            ElevatedButton(
              onPressed: () async {
                NotasDatabase dbNotas = NotasDatabase();
                dbNotas.eliminarGasto(1);
              },
              child: Text("Eliminar la nota 1"),
            ),
            ElevatedButton(
              onPressed: () async {
                NotasDatabase dbNotas = NotasDatabase();

                NotaModel notaModelAux = NotaModel(
                  titulo: "titulo de una notamodel",
                  contenido: "CONTENIDOI DE UNA NOTAMODEL",
                );

                dbNotas.insertarNotaModel(notaModelAux);
              },
              child: Text("Insertar NotaModel"),
            ),
            ElevatedButton(
              onPressed: () async {
                NotasDatabase dbNotas = NotasDatabase();

                List<NotaModel> notas = await dbNotas.obtenerNotasModel();
                print(notas);
              },
              child: Text("Obtener notasModel List"),
            ),
          ],
        ),
      ),
    );
  }
}
