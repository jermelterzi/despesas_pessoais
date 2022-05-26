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
            height: 480,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 4,
                  child: ListTile(
                    leading: const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        )),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: Text(
                      'R\$${tr.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              },
            ),
          );
  }
}
