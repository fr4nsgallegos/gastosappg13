import 'package:flutter/material.dart';
import 'package:gastosappg13/db/db_admin_gastos.dart';
import 'package:gastosappg13/generated/l10n.dart';
import 'package:gastosappg13/models/gasto_model.dart';
import 'package:gastosappg13/widgets/busqueda_widget.dart';
import 'package:gastosappg13/widgets/item_widget.dart';
import 'package:gastosappg13/widgets/register_modal_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GastoModel> gastosList = [];

  Future<void> getDataFromDB() async {
    gastosList = await DbAdminGastos().obtenerGastos();
    setState(() {});
  }

  void showRegisterModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: RegisterModalWidget(),
        );
      },
    ).then((value) {
      getDataFromDB();
    });
  }

  @override
  void initState() {
    getDataFromDB();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showRegisterModal();
                  },
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Agregar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Ingresa tus gastos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(S.of(context).hello),
                        Text(S.of(context).helloAlguien("Jhonny")),
                        Text(
                          "Gestiona tus gastos de mejor forma",
                          style: TextStyle(color: Colors.black45, fontSize: 16),
                        ),
                        BusquedaWidget(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: gastosList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ItemWidget(gastoModel: gastosList[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 90),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
