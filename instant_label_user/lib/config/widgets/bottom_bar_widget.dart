import 'package:flutter/material.dart';
import 'package:instant_label_user/config/constants/constant_colours.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label_user/screens/history/history_screen.dart';
import 'package:instant_label_user/screens/scan/home_screen.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
          ),
        ],
        color: PRIMARY_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavbarIcon(
              title: 'Scan',
              icon: Icons.scanner,
              onTap: () {
                context.go(HomeScreen.path);
              },
            ),
            NavbarIcon(
              title: 'History',
              icon: Icons.history,
              onTap: () {
                context.go(HistoryScreen.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavbarIcon extends StatelessWidget {
  final Function() onTap;
  final String title;
  final IconData icon;
  const NavbarIcon(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, color: PRIMARY_ON_COLOR),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: PRIMARY_ON_COLOR),
            ),
          ],
        ),
      ),
    );
  }
}
