// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomListCardWidget extends StatelessWidget {
  final String title;
  const CustomListCardWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.white,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xff004586),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      onTap: () {},
    );
  }
}
