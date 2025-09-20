import 'package:flutter/material.dart';
import 'package:gastosappg13/widgets/field_modal_widget.dart';

class RegisterModalWidget extends StatefulWidget {
  const RegisterModalWidget({super.key});

  @override
  State<RegisterModalWidget> createState() => _RegisterModalWidgetState();
}

class _RegisterModalWidgetState extends State<RegisterModalWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
      width: double.infinity,
      child: Column(
        children: [
          Text("Registra el pago"),
          SizedBox(height: 24),
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
        ],
      ),
    );
  }
}
