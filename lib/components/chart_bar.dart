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
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              const Icon(Icons.attach_money),
              SizedBox(
                height: 60,
                width: 10,
                child: Text(dailyTransactionSum.toString()),
              ),
              Text(dayOfWeek),
            ],
          ),
        ],
      ),
    );
  }
}
