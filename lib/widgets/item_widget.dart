import 'package:flutter/material.dart';
import 'package:gastosappg13/models/gasto_model.dart';

class ItemWidget extends StatelessWidget {
  GastoModel gastoModel;

  ItemWidget({super.key, required this.gastoModel});

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
          gastoModel.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(gastoModel.datetime),
        trailing: Text(
          "S/ ${gastoModel.price}",
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
