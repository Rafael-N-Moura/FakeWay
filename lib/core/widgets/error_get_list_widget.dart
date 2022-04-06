import 'package:flutter/material.dart';

class ErrorGetListWidget extends StatelessWidget {
  final String textError;
  const ErrorGetListWidget({Key? key, required this.textError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.error,
          color: Colors.redAccent,
          size: 64,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          textError,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
