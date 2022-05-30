import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final Function(double p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
        trailing: FittedBox(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  'R\$${tr.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              MediaQuery.of(context).size.width > 480
                  ? ElevatedButton.icon(
                      onPressed: () => onRemove(tr.id),
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    )
                  : IconButton(
                      onPressed: () => onRemove(tr.id),
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
