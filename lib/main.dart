import 'package:flutter/material.dart';

import 'widgets/fuel_cost_input.dart';
import 'widgets/tip_slider.dart';
import 'widgets/total_per_traveller.dart';
import 'widgets/traveller_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fgift',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const Fgift(),
    );
  }
}

class Fgift extends StatefulWidget {
  const Fgift({super.key});

  @override
  State<Fgift> createState() => _FgiftState();
}

class _FgiftState extends State<Fgift> {
  int _personCount = 3;
  double _giftPercentage = 0.2;
  double _fuelCost = 0.0;
  final TextEditingController _fuelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final totalPerTraveller = _fuelCost > 0
        ? (_fuelCost * (1 + _giftPercentage)) / _personCount
        : 0.0;

    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        title: const Text(
          'Fuel Cost Sharing',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: SizedBox(
          width: 420,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TotalPerTraveller(
                  total: totalPerTraveller,
                  titleStyle: titleStyle,
                ),
                const SizedBox(height: 18),
                FuelCostInput(
                  controller: _fuelController,
                  onChanged: (String value) {
                    final parsed = double.tryParse(value) ?? 0.0;
                    setState(() {
                      _fuelCost = parsed;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Container(
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
                            personCount: _personCount,
                            onDecrement: () {
                              setState(() {
                                if (_personCount > 1) {
                                  _personCount--;
                                }
                              });
                            },
                            onIncrement: () {
                              setState(() {
                                _personCount++;
                              });
                            },
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
                          giftPercentage: _giftPercentage,
                          onChanged: (double value) {
                            setState(() {
                              _giftPercentage = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
