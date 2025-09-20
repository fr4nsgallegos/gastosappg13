import 'package:flutter/material.dart';

class FieldModalWidget extends StatelessWidget {
  String hint;
  TextEditingController controller;
  bool isNumberKeyboard;
  bool isDatePicker;
  VoidCallback? function;

  FieldModalWidget({
    required this.hint,
    required this.controller,
    this.isNumberKeyboard = false,
    this.isDatePicker = false,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        onTap: function,
        readOnly: function != null ? true : false,
        controller: controller,
        keyboardType: isNumberKeyboard
            ? TextInputType.number
            : TextInputType.text,
        decoration: InputDecoration(
          hint: Text(hint),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: Colors.black.withOpacity(0.05),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
