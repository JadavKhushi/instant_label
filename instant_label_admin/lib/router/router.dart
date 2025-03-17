import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instant_label/screens/dashboard/dash_body.dart';
import 'package:instant_label/screens/dashboard/dashboard_screen.dart';
import 'package:instant_label/screens/dashboard/pages/category/category_screen.dart';
import 'package:instant_label/screens/dashboard/pages/category/pages/create/create_category.dart';
import 'package:instant_label/screens/dashboard/pages/category/pages/edit/edit_category_screen.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/create/create_ingredients.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/edit/edit_ingredients.dart';
import 'package:instant_label/screens/dashboard/pages/ingredients/ingredients_screen.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/create/create_product.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/edit/pro_edit.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/image_add/pro_image.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/info/pro_info.dart';
import 'package:instant_label/screens/dashboard/pages/product/pages/list/list_screen.dart';
import 'package:instant_label/screens/dashboard/pages/product/product_screen.dart';
import 'package:instant_label/screens/error_page.dart';
import 'package:instant_label/screens/index_screen/index_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  errorBuilder: (context, state) {
    return const ErrorPage();
  },
  initialLocation: IndexScreen.routepath,
  routes: [
    //Main Page Index
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: IndexScreen.routepath,
      builder: (context, state) => const IndexScreen(),
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => DashBody(child: child),
      routes: [
        //from Index - Dashboard
        GoRoute(
          path: DashboardScreen.routepath,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DashboardScreen(),
          ),
        ),
        //category
        GoRoute(
          path: CategoryScreen.routepath,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CategoryScreen(),
          ),
          routes: [
            GoRoute(
              path: CreateCategory.routepath,
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CreateCategory(),
              ),
            ),
            GoRoute(
              path: EditCategoryScreen.routepath,
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: EditCategoryScreen(),
              ),
            ),
          ],
        ),
        //ingredients
        GoRoute(
          path: IngredientsScreen.routepath,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: IngredientsScreen(),
          ),
          //create-ingredients
          routes: [
            GoRoute(
              path: CreateIngredients.routepath,
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CreateIngredients(),
              ),
            ),
            //edit- ingredients
            GoRoute(
              path: EditIngredientsScreen.routepath,
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: EditIngredientsScreen(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: ProductScreen.routepath,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProductScreen(),
          ),
          routes: [
            //product - listScreen
            GoRoute(
              path: ListScreen.routepath,
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) {
                int? categoryid = state.extra as int?;
                if (categoryid == null) {
                  return const NoTransitionPage(child: ErrorPage());
                }
                return NoTransitionPage(
                  child: ListScreen(categoryId: categoryid),
                );
              },
              //listScreen -> create / info / edit / image
              routes: [
                GoRoute(
                  path: CreateProduct.routepath,
                  parentNavigatorKey: shellNavigatorKey,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: CreateProduct(),
                    );
                  },
                ),
                GoRoute(
                  path: ProductInfo.routepath,
                  parentNavigatorKey: shellNavigatorKey,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ProductInfo(),
                  ),
                ),
                GoRoute(
                  path: EditProduct.routepath,
                  parentNavigatorKey: shellNavigatorKey,
                  pageBuilder: (context, state) {
                    String? data = state.extra as String?;
                    return NoTransitionPage(
                      child: EditProduct(data: data ?? ""),
                    );
                  },
                ),
                GoRoute(
                  path: ProductImage.routepath,
                  parentNavigatorKey: shellNavigatorKey,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: ProductImage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
