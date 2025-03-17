import 'package:flutter/material.dart';

class SideIconWidget extends StatelessWidget {
  final Function() onTap;
  final IconData? icon;
  final String name;
  const SideIconWidget({super.key,  required this.onTap, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Icon(icon),
            Text(name),
          ],
        ),
      ),
    );
  }
}
