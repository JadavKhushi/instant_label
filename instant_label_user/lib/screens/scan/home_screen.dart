import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:go_router/go_router.dart';
import 'package:instant_label_user/config/constants/constant_size.dart';
import 'package:instant_label_user/config/widgets/app_bar_widget.dart';
import 'package:instant_label_user/screens/product_details/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routepath = '/';
  static const String path = routepath;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  scanmethod(BuildContext context) {
    FlutterBarcodeScanner.scanBarcode(
      '#9a2848',
      'CANCEL',
      true,
      ScanMode.BARCODE,
    ).then(
      (value) {
        if (value != "-1") {
          context.go(ProductDetailsScreen.path, extra: value);
        } else if (value == "-1") {
          return const Text('Product not fopund!');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: 'Scan Your Food Barcode!'),
            const SizedBox(height: Space_L),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  scanmethod(context);
                },
                child: const Text('Scan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
