import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/config/constants/constant_size.dart';
import 'package:instant_label/config/widget/app_card_widget.dart';
import 'package:instant_label/config/widget/page_body.dart';

class DashboardScreen extends StatelessWidget {
  static const String routepath = '/dashboard';
  static const String path = routepath;
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBody(
      title: "Dashboard",
      child: AppCardWidget(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  GoRouterState.of(context).uri.toString(),
                  style: const TextStyle(fontSize: FontSize_S),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
