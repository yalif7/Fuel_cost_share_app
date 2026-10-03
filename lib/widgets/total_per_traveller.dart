import 'package:flutter/material.dart';

class TotalPerTraveller extends StatelessWidget {
  const TotalPerTraveller({
    super.key,
    required this.total,
    required this.titleStyle,
  });

  final double total;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE9B8A8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Total Fuel Cost Per Traveller',
            style: titleStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '£${total.toStringAsFixed(2)}',
            style: titleStyle.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 52,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
