import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final Function(String text, double value) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              fillColor: Colors.blue,
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: valueController,
            decoration: const InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  final String title = titleController.text;
                  final double value = double.tryParse(valueController.text) ?? 0.0;
                  onSubmit(title, value);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: const Text('Nova transação'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
