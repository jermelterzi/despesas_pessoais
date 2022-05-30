import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptiveDatePicker extends StatelessWidget {
  const AdaptiveDatePicker(
      {Key? key, required this.selectedDate, required this.onChanged})
      : super(key: key);

  final DateTime selectedDate;
  final Function(DateTime) onChanged;

  @override
  Widget build(BuildContext context) {
    _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
      ).then((date) {
        if (date == null) {
          return;
        }
        onChanged(date);
      });
    }

    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onChanged,
            ),
          )
        : SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Data selecionada: ${DateFormat('d/MM/y').format(selectedDate)}'),
                TextButton(
                  onPressed: _showDatePicker,
                  child: const Text('Selecionar Data'),
                ),
              ],
            ),
          );
  }
}
