import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Tênis',
      price: 300.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      price: 200.0,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            color: Colors.blue,
            elevation: 5,
            child: Text('Relatório de Despesas'),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(tr.price.toString()),
                    ),
                    Column(
                      children: [
                        Text(tr.title),
                        Text(tr.date.toIso8601String()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
