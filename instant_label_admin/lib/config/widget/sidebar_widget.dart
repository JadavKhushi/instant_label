import 'package:flutter/material.dart';
import 'package:instant_label/config/constants/constant_colours.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/screens/dashboard/dashboard_screen.dart';
import 'package:instant_label/screens/dashboard/pages/category/category_screen.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/ingredients_screen.dart';
import 'package:instant_label/screens/dashboard/pages/product/product_screen.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

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
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            NavbarIcon(
              icon: Icons.dashboard,
              onTap: () {
                context.go(DashboardScreen.path);
              },
              title: 'Dashboard',
            ),
            NavbarIcon(
              icon: Icons.category,
              onTap: () {
                context.go(CategoryScreen.path);
              },
              title: 'Category',
            ),
            NavbarIcon(
              icon: Icons.format_list_bulleted_rounded,
              onTap: () {
                context.go(IngredientsScreen.path);
              },
              title: 'Ingrediants',
            ),
            NavbarIcon(
              icon: Icons.fastfood,
              onTap: () {
                context.go(ProductScreen.path);
              },
              title: 'Products',
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
        vertical: 8,
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
