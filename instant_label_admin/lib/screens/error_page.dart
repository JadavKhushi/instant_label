import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            '404 Page Not Found!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
