import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key? key,
    required this.dailyTransactionSum,
    required this.dayOfWeek,
    required this.percentageOfWeek,
  }) : super(key: key);

  final double dailyTransactionSum;
  final String dayOfWeek;
  final double percentageOfWeek;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 40,
          child: FittedBox(
            child: Text('R\$${dailyTransactionSum.toStringAsFixed(2)}'),
          ),
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentageOfWeek,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(dayOfWeek),
      ],
    );
  }
}
