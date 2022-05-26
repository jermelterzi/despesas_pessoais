import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart(this.transactionsGroup, {Key? key}) : super(key: key);

  final List<Transaction> transactionsGroup;

  List<Map<String, Object>> get weeklyTransactions {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        double dailyTransactionsSum = 0.0;

        for (int i = 0; i < transactionsGroup.length; i++) {
          bool sameDay = transactionsGroup[i].date.day == weekDay.day;
          bool sameMonth = transactionsGroup[i].date.month == weekDay.month;
          bool sameYear = transactionsGroup[i].date.year == weekDay.year;

          if (sameDay && sameMonth && sameYear) {
            dailyTransactionsSum += transactionsGroup[i].price;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay)[0],
          'dailyTransactions': dailyTransactionsSum,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: weeklyTransactions.map((tr) {
          return ChartBar(
            dailyTransactionSum: double.tryParse(tr['dailyTransactions'].toString()) ?? 0,
            dayOfWeek: tr['day'].toString(),
            percentageOfWeek: 0,
          );
        }).toList(),
      ),
    );
  }
}
