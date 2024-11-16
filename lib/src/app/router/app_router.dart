// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_project/src/features/order/presentation/pages/order_list_page.dart';
import 'package:test_project/src/features/table/presentation/pages/dashboard_page.dart';
import 'package:test_project/src/features/table/presentation/pages/table_page.dart';
import 'package:test_project/src/features/table/presentation/pages/view_table_page.dart';
import 'package:test_project/src/shared/wrappers/main_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/dashboard',
          page: DashboardRoute.page,
          initial: true,
          children: [
            RedirectRoute(path: '', redirectTo: 'table-service'),
            AutoRoute(
              path: 'table-service',
              page: TableRoute.page,
            ),
            AutoRoute(
              path: 'order-list',
              page: OrderListRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/view-table',
          page: ViewTableRoute.page,
        ),
      ];
}
