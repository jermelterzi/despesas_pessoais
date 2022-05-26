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
    ).reversed.toList();
  }

  double get _weeklyTransactionsSum {
    return weeklyTransactions.fold(0.0, (sum, tr) {
      return sum + double.parse(tr['dailyTransactions'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weeklyTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                dailyTransactionSum: double.parse(tr['dailyTransactions'].toString()),
                dayOfWeek: tr['day'].toString(),
                percentageOfWeek:double.parse(tr['dailyTransactions'].toString()) / _weeklyTransactionsSum,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
