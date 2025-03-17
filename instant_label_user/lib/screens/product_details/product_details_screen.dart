import 'package:flutter/material.dart';
import 'package:instant_label_user/config/constants/constant_colours.dart';
import 'package:instant_label_user/config/constants/constant_fonts.dart';
import 'package:instant_label_user/config/constants/constant_size.dart';
import 'package:instant_label_user/config/widgets/apicall_widget.dart';
import 'package:instant_label_user/config/widgets/app_bar_widget.dart';
import 'package:instant_label_user/db/db_helper.dart';
import 'package:instant_label_user/screens/history/history_screen.dart';
import 'package:instant_label_user/screens/product_details/controller/api/product_controller_api.dart';
import 'package:instant_label_user/screens/product_details/controller/model/product_api.dart';
import 'package:instant_label_user/screens/scan/home_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routepath = 'product-details';
  static const String path = '${HomeScreen.path}$routepath';
  static const String historypath = '${HistoryScreen.path}/$routepath';
  final String barcodeRes;
  const ProductDetailsScreen({super.key, required this.barcodeRes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const AppBarWidget(title: 'Product-detail'),
              const SizedBox(height: Space_L),
              APICallWidget(
                future: ProductControllerAPI.getProduct(barcodeRes),
                onSuccess: (data) {
                  ProductAPI api = data;
                  if (api.status ?? false) {
                    ProductAPIData apidata = api.data ?? ProductAPIData();
                    DatabaseHelper.initDatabase();
                    // HistTableDB.insertData(
                    //   HistoryModelTable(
                    //     barcode: apidata.productBarcode ?? "",
                    //     name: apidata.productName ?? "",
                    //     category: apidata.categoryName ?? "",
                    //     image: apidata.productId.toString(),
                    //   ),
                    // );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: SECONDARY_COLOR,
                            shape: BoxShape.rectangle,
                          ),
                          width: 100,
                          height: 100,
                          child: const Icon(Icons.fastfood),
                        ),
                        const SizedBox(height: Space_L),
                        Text(
                          apidata.productName.toString(),
                          style: const TextStyle(
                              color: PRIMARY_COLOR,
                              fontFamily: Fonts_Bold,
                              fontSize: FontSize_L),
                        ),
                        const SizedBox(height: Space_R),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  apidata.caloriesVal.toString(),
                                  style: const TextStyle(
                                      fontSize: FontSize_L, color: Colors.red),
                                ),
                                const SizedBox(height: Space_XS),
                                const Text(
                                  'Calories',
                                  style: TextStyle(
                                    fontSize: FontSize_XS,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  apidata.sugarVal.toString(),
                                  style: const TextStyle(
                                      fontSize: FontSize_L, color: Colors.blue),
                                ),
                                const SizedBox(height: Space_XS),
                                const Text(
                                  'Sugar(g)',
                                  style: TextStyle(
                                    fontSize: FontSize_XS,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  apidata.protienVal.toString(),
                                  style: const TextStyle(
                                      fontSize: FontSize_L,
                                      color: Colors.green),
                                ),
                                const SizedBox(height: Space_XS),
                                const Text(
                                  'Protien(g)',
                                  style: TextStyle(
                                    fontSize: FontSize_XS,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  apidata.fatVal.toString(),
                                  style: const TextStyle(
                                      fontSize: FontSize_L,
                                      color: Colors.orange),
                                ),
                                const SizedBox(height: Space_XS),
                                const Text(
                                  'Fat(g)',
                                  style: TextStyle(
                                    fontSize: FontSize_XS,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: Space_R),
                        Text(apidata.categoryName.toString()),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            color: Color(0xffC8CFA0),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  SizedBox(width: Space_L),
                                  Icon(
                                    size: 30,
                                    Icons.sentiment_very_satisfied_sharp,
                                    fill: 1,
                                    color: PRIMARY_COLOR,
                                  ),
                                  SizedBox(width: Space_L),
                                  Text(
                                    'Best For You!',
                                    style: TextStyle(
                                      fontSize: FontSize_R,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Salt: ${apidata.sodiumVal}'),
                                      Text('Alcohol: ${apidata.alcoholVal}'),
                                      Text(
                                          'Cholesterol: ${apidata.cholesterolVal}'),
                                      Text('Copper: ${apidata.copperVal}'),
                                      Text('Fiber: ${apidata.fiberVal}'),
                                      Text(
                                          'Carbohydrates: ${apidata.carbsVal}'),
                                      Text('Selenium: ${apidata.seleniumVal}'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('vitamin A: ${apidata.vitAVal}'),
                                      Text('vitamin B1: ${apidata.vitB1Val}'),
                                      Text('vitamin B2: ${apidata.vitB2Val}'),
                                      Text('vitamin B6: ${apidata.vitB6Val}'),
                                      Text('vitamin B12: ${apidata.vitB12Val}'),
                                      Text('vitamin C: ${apidata.vitCVal}'),
                                      Text('vitamin D: ${apidata.vitDVal}'),
                                      Text('vitamin E: ${apidata.vitEVal}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Text('Something wrong');
                  }
                },
              ),
              // Text(barcodeRes),
            ],
          ),
        ),
      ),
    );
  }
}
