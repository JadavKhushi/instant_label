import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';

class BreadCumWidget extends StatelessWidget {
  final String title;
  const BreadCumWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: PRIMARY_ON_COLOR,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: Space_L),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: FontSize_L),
          ),
          Text(
            GoRouterState.of(context).uri.toString(),
            style: const TextStyle(fontSize: FontSize_R),
          ),
        ],
      ),
    );
  }
}
