import 'package:flutter/material.dart';

class FuelCostInput extends StatelessWidget {
  const FuelCostInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFB56D55),
          width: 2,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter Fuel Cost',
          hintStyle: TextStyle(
            color: Color(0xFF5B453F),
            fontSize: 18,
          ),
        ),
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 18),
        onChanged: onChanged,
      ),
    );
  }
}
