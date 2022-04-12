import 'package:fake_way/core/utils/way_colors.dart';
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
        Image.asset(
          'assets/images/network_error.png',
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          textError,
          style: TextStyle(
            color: WayColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
