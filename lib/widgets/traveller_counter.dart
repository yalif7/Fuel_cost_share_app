import 'package:flutter/material.dart';

class TravellerCounter extends StatelessWidget {
  const TravellerCounter({
    super.key,
    required this.theme,
    required this.personCount,
    required this.onDecrement,
    required this.onIncrement,
  });

  final ThemeData theme;
  final int personCount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (personCount > 1) {
              onDecrement();
            }
          },
          icon: const Icon(Icons.remove),
          splashRadius: 20,
          color: theme.colorScheme.primary,
        ),
        Text(
          '$personCount',
          style: const TextStyle(fontSize: 24),
        ),
        IconButton(
          onPressed: onIncrement,
          icon: const Icon(Icons.add),
          splashRadius: 20,
          color: theme.colorScheme.primary,
        ),
      ],
    );
  }
}
