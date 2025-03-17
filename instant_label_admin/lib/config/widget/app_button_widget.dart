import 'package:flutter/material.dart';
import 'package:instant_label/config/constants/constant_colours.dart';

class AppButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String name;
  const AppButtonWidget({super.key, required this.onPressed, required this.name,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(PRIMARY_COLOR),
      ),
      child: Text(name),
    );
  }
}
