import 'package:flutter/material.dart';
import 'package:instant_label_user/config/widgets/bottom_bar_widget.dart';

class HomeBody extends StatelessWidget {
  final Widget child;
  const HomeBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: child),
            const BottomBarWidget(),
          ],
        ),
      ),
    );
  }
}
