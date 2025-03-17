import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label_user/config/constants/constant_size.dart';
import 'package:instant_label_user/config/widgets/app_bar_widget.dart';
import 'package:instant_label_user/config/widgets/product_item_widget.dart';
import 'package:instant_label_user/db/table/histroy/history_model.dart';
import 'package:instant_label_user/db/table/histroy/history_table.dart';
import 'package:instant_label_user/screens/product_details/product_details_screen.dart';

import '../../config/widgets/apicall_widget.dart';

class HistoryScreen extends StatelessWidget {
  static const String routepath = '/history';
  static const String path = routepath;
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(title: 'History'),
            const SizedBox(height: Space_L),
            Expanded(
              child: FutureBuilder(
                future: HistTableDB.findAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<HistoryModelTable> list = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ProductItemWidget(
                              onTap: () {
                                context.go(
                                  ProductDetailsScreen.historypath,
                                  extra: list[index].barcode,
                                );
                              },
                              title: list[index].name,
                              barcode: list[index].barcode,
                            ),
                            const SizedBox(height: Space_R),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text('data not found');
                  }
                  return const APILoaderWidget();
                },
              ),
            ),

            // const CircleAvatar(
            //   child: Image(
            //     image: NetworkImage(
            //         'https://i0.wp.com/sunrisedaycamp.org/wp-content/uploads/2020/10/placeholder.png?ssl=1'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
