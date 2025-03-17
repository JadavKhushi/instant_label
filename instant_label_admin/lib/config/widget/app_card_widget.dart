import 'package:flutter/material.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';

class AppCardWidget extends StatelessWidget {
  final Widget child;
  const AppCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Space_S                                                                                    
      ),
      decoration: BoxDecoration(
        color: PRIMARY_ON_COLOR,
        borderRadius: BorderRadius.circular(Space_XS),
      ),
      child: child,
    );
  }
}
