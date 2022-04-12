import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final String type;
  final String message;

  const CustomSnackBar(this.type, this.message,
      {Key? key, required Widget content})
      : super(key: key, content: content);

  Widget build(BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: type == 'sucess'
          ? Colors.green
          : type == 'failure'
              ? Colors.red
              : Colors.grey,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
