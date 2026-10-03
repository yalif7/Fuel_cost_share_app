import 'package:flutter/material.dart';

import 'tip_slider.dart';
import 'traveller_counter.dart';

class SplitAndTipCard extends StatelessWidget {
  const SplitAndTipCard({
    super.key,
    required this.personCount,
    required this.giftPercentage,
    required this.theme,
    required this.onDecrement,
    required this.onIncrement,
    required this.onTipChanged,
  });

  final int personCount;
  final double giftPercentage;
  final ThemeData theme;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final ValueChanged<double> onTipChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFB56D55),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Split',
                style: TextStyle(fontSize: 22),
              ),
              TravellerCounter(
                theme: theme,
                personCount: personCount,
                onDecrement: onDecrement,
                onIncrement: onIncrement,
              ),
            ],
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFB56D55),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TipSlider(
              giftPercentage: giftPercentage,
              onChanged: onTipChanged,
            ),
          ),
        ],
      ),
    );
  }
}
