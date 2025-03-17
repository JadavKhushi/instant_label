import 'package:flutter/material.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/breadcum_widget.dart';

class PageBody extends StatelessWidget {
  final String title;
  final Widget child;

  const PageBody({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: Space_S, right: Space_S, left: Space_S),
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 1300, maxHeight: double.infinity),
            child: Column(
              children: [
                BreadCumWidget(
                  title: title,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
