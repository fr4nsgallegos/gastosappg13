import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isSelected;
  final VoidCallback tap;
  const ItemTypeWidget({
    super.key,
    required this.data,
    required this.isSelected,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.cyan.withOpacity(0.3)
              : Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(data["image"], width: 40, height: 40),
            SizedBox(width: 8),
            Text(data["name"]),
          ],
        ),
      ),
    );
  }
}
