import 'package:flutter/material.dart';

class FormConstraintWidget extends StatelessWidget {
  final Widget child;
  const FormConstraintWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: child,
    );
  }
}
