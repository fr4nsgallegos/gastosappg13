import 'package:flutter/material.dart';

class BusquedaWidget extends StatelessWidget {
  const BusquedaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Buscar por título",
          hintStyle: TextStyle(color: Colors.black45, fontSize: 14),
          filled: true,
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
