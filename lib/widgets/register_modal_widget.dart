import 'package:flutter/material.dart';
import 'package:gastosappg13/db/db_admin_gastos.dart';
import 'package:gastosappg13/models/gasto_model.dart';
import 'package:gastosappg13/utils/data_general.dart';
import 'package:gastosappg13/widgets/field_modal_widget.dart';
import 'package:gastosappg13/widgets/item_type_widget.dart';

class RegisterModalWidget extends StatefulWidget {
  const RegisterModalWidget({super.key});

  @override
  State<RegisterModalWidget> createState() => _RegisterModalWidgetState();
}

class _RegisterModalWidgetState extends State<RegisterModalWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String typeSelected = "Alimentos";

  void showDateTimePicker() async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            colorScheme: ColorScheme.light(primary: Colors.red),
          ),
          child: child!,
        );
      },
    );
    dateController.text = datePicker.toString();
    print(dateController.text);
  }

  _buildAddButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          GastoModel gastoModel = GastoModel(
            title: titleController.text,
            price: double.parse(priceController.text),
            datetime: dateController.text,
            type: typeSelected,
          );

          DbAdminGastos().insertarGasto(gastoModel).then((value) {
            if (value > 0) {
              // Se ha insertado correctamente
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.cyan,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  content: Text("Se ha registrado correctamente"),
                ),
              );
              Navigator.pop(context);
            }
          });
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: Text("Añadir", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Registra el pago", style: TextStyle(fontSize: 24)),
                  SizedBox(height: 12),
                  FieldModalWidget(
                    hint: "Ingresa el título",
                    controller: titleController,
                  ),
                  FieldModalWidget(
                    hint: "Ingresa el monto",
                    controller: priceController,
                    isNumberKeyboard: true,
                  ),
                  FieldModalWidget(
                    hint: "Ingresa la fecha",
                    controller: dateController,
                    function: () {
                      showDateTimePicker();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: types
                          .map(
                            (e) => ItemTypeWidget(
                              data: e,
                              isSelected: typeSelected == e["name"]
                                  ? true
                                  : false,
                              tap: () {
                                typeSelected = e["name"];
                                setState(() {});
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildAddButton(),
        ],
      ),
    );
  }
}
