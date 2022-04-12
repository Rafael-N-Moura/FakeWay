import 'package:flutter/material.dart';

import '../../../../core/utils/way_colors.dart';

class ScrollIndicatorWidget extends StatelessWidget {
  const ScrollIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.87,
      width: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WayColors.primaryColor,
      ),
    );
  }
}
