import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required this.giftPercentage,
    required this.onChanged,
  });

  final double giftPercentage;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tip',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '${(giftPercentage * 100).round()}',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Slider(
          value: giftPercentage,
          min: 0,
          max: 1,
          divisions: 10,
          activeColor: const Color(0xFF8B4F34),
          inactiveColor: const Color(0xFFD8B5A1),
          thumbColor: const Color(0xFF8B4F34),
          label: '${(giftPercentage * 100).round()}%',
          onChanged: onChanged,
        ),
      ],
    );
  }
}
