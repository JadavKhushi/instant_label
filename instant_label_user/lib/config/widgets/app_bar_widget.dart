import 'package:flutter/material.dart';
import 'package:instant_label_user/config/constants/constant_colours.dart';
import 'package:instant_label_user/config/constants/constant_fonts.dart';
import 'package:instant_label_user/config/constants/constant_size.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      color: PRIMARY_COLOR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: FONTS_REGULAR,
              fontSize: FontSize_L,
              color: PRIMARY_ON_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
