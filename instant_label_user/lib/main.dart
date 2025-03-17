import 'package:flutter/material.dart';
import 'package:instant_label_user/config/router/router.dart';
// import 'package:instant_label_user/db/db_helper.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // DatabaseHelper db = DatabaseHelper.instance;

  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
