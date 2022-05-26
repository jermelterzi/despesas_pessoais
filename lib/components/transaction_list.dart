import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  final List<dynamic> transactions;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'Nenhuma Transação Cadastrada!',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
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
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          ' R\$ ${tr.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
