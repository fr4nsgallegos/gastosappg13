import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          "Cine",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text("2025/09/19"),
        trailing: Text(
          "S/ 50.0",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        leading: Image.asset(
          "assets/icons/alimentos.webp",
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
