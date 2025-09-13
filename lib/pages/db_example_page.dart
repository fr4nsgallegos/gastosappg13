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
                  "Compras de la semana",
                  "comprar pan, huevos, sal y pimienta",
                );
              },
              child: Text("Insertar Nota"),
            ),
          ],
        ),
      ),
    );
  }
}
