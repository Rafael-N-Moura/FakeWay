import 'package:flutter/material.dart';
import '../../../../core/utils/way_colors.dart';

class ValuePickerComponentWidget extends StatelessWidget {
  const ValuePickerComponentWidget({
    Key? key,
    required this.label1,
    required this.label2,
  }) : super(key: key);

  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 48,
          decoration: BoxDecoration(
            color: WayColors.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              label1,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Sansation',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Container(
          width: 50,
          height: 48,
          decoration: BoxDecoration(
            color: WayColors.primaryColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              label2,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Sansation',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
