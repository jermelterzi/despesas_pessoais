import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextField extends StatelessWidget {
  AdaptiveTextField({
    Key? key,
    required this.controller,
    required this.onSubmitted,
    required this.label,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onSubmitted;
  TextInputType keyboardType = TextInputType.text;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            placeholder: label,
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
            keyboardType: keyboardType,
          );
  }
}
