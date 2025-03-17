import 'package:flutter/material.dart';
import 'package:instant_label_user/config/constants/constant_colours.dart';
import 'package:instant_label_user/config/constants/constant_size.dart';

class ProductItemWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String barcode;
  const ProductItemWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.barcode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Space_R),
        decoration: BoxDecoration(
          color: SECONDARY_COLOR,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://i0.wp.com/sunrisedaycamp.org/wp-content/uploads/2020/10/placeholder.png?ssl=1',
              ),
              // backgroundColor: Colors.transparent,
            ),
            Text(title),
            Text(barcode),
          ],
        ),
      ),
    );
  }
}
