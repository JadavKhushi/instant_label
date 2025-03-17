import 'package:flutter/material.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/sidebar_widget.dart';

class DashBody extends StatelessWidget {
  final Widget child;
  const DashBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              color: PRIMARY_COLOR,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Instant Label',
                    style: TextStyle(
                      fontSize: FontSize_L,
                      color: PRIMARY_ON_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const SideBarWidget(),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

