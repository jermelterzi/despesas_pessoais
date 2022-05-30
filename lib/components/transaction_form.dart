import 'package:expenses/components/adaptive_date_picker.dart';
import 'package:expenses/components/adaptive_textfield.dart';
import 'package:flutter/material.dart';

import 'adaptive_button.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  final Function(String text, double value, DateTime date) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final String title = _titleController.text;
    final double value = double.tryParse(_valueController.text) ?? 0.0;
    final DateTime date = _selectedDate;

    if (title.isEmpty || value == 0) {
      return;
    }

    widget.onSubmit(title, value, date);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            AdaptiveTextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              label: 'Título',
              keyboardType: TextInputType.text,
            ),
            AdaptiveTextField(
              controller: _valueController,
              onSubmitted: (_) => _submitForm(),
              label: 'Valor (R\$)',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            AdaptiveDatePicker(
              selectedDate: _selectedDate,
              onChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptiveButton(
                  onPressed: _submitForm,
                  label: 'Nova Transação',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
