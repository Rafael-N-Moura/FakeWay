import 'package:flutter/material.dart';

class ProcurarEmpresaWidget extends StatelessWidget {
  const ProcurarEmpresaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "Procurar Empresa"),
    );
  }
}
