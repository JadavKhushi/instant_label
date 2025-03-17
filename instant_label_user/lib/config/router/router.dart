import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label_user/screens/error_page.dart';
import 'package:instant_label_user/screens/history/history_screen.dart';
import 'package:instant_label_user/screens/product_details/product_details_screen.dart';
import 'package:instant_label_user/screens/scan/home_body.dart';
import 'package:instant_label_user/screens/scan/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  errorBuilder: (context, state) {
    return const ErrorScreen();
  },
  initialLocation: HomeScreen.routepath,
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => HomeBody(child: child),
      routes: [
        GoRoute(
          path: HomeScreen.routepath,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
          routes: [
            GoRoute(
              path: ProductDetailsScreen.routepath,
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                String extra = state.extra as String;
                return ProductDetailsScreen(barcodeRes: extra);
              },
            ),
          ],
        ),
        GoRoute(
          path: HistoryScreen.routepath,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HistoryScreen(),
          ),
          routes: [
            GoRoute(
              path: ProductDetailsScreen.routepath,
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                String extra = state.extra as String;
                return ProductDetailsScreen(barcodeRes: extra);
              },
            ),
          ],
          
        ),
      ],
    ),
  ],
);
