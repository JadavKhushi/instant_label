import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/screens/dashboard/dashboard_screen.dart';

class IndexScreen extends StatelessWidget {
  static const String routepath = '/';
  static const String path = routepath;
  const IndexScreen({super.key});    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 146, 217),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Index Screen'),
            ElevatedButton(
              onPressed: () {
                context.go(DashboardScreen.path);
              },
              child: const Text('Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
