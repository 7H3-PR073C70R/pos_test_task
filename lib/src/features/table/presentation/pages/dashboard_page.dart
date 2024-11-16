import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/src/app/router/app_router.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/router_extension.dart';
import 'package:test_project/src/core/extensions/string_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';
import 'package:test_project/src/features/table/presentation/widgets/drawer_card.dart';
import 'package:test_project/src/l10n/l10n.dart';
import 'package:test_project/src/shared/widgets/app_button.dart';

@RoutePage()
class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeString = useState('Table Service');
    final localization = context.l10n;
    return AutoTabsScaffold(
      drawer: const Drawer(
        child: DrawerBody(),
      ),
      appBarBuilder: (context, _) => PreferredSize(
        preferredSize: Size.fromHeight(50.height),
        child: AppBar(
          centerTitle: true,
          title: Text(routeString.value),
          actions: [
            if (routeString.value == 'ORDER LIST')
              Padding(
                padding: EdgeInsets.only(right: 16.width),
                child: const Icon(Icons.filter_list_rounded),
              ),
          ],
        ),
      ),
      routes: const [
        TableRoute(),
        OrderListRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        Future.delayed(const Duration(milliseconds: 500), () {
          routeString.value =
              tabsRouter.current.path.replaceAll('-', ' ').capitalizeFirst;
        });
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: AppColors.kcOffWhite,
          selectedItemColor: AppColors.kcBlack,
          unselectedItemColor: AppColors.kcBlack,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.login_outlined,
              ),
              activeIcon: const Icon(
                Icons.login_outlined,
              ),
              label: localization.exit,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.list_alt,
              ),
              activeIcon: const Icon(
                Icons.home_max_outlined,
              ),
              label: localization.orderList,
            ),
          ],
        );
      },
    );
  }
}

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12.radius),
      child: Column(
        children: [
          AppSpacing.setVerticalSpace(50),
          Row(
            children: [
              const Icon(
                Icons.account_circle_outlined,
                size: 45,
              ),
              AppSpacing.horizontalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '0',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.kcDarkText,
                    ),
                  ),
                  Text(
                    'Sylvia Do',
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
              const Spacer(),
              const BackButton(),
            ],
          ),
          AppSpacing.setVerticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Account ',
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.kcDarkText,
                ),
              ),
              Text(
                'testsoupa ',
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.kcDarkText,
                ),
              ),
            ],
          ),
          AppSpacing.setVerticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Workplace',
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.kcDarkText,
                ),
              ),
              Text(
                'Waiter 1',
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.kcDarkText,
                ),
              ),
            ],
          ),
          AppSpacing.setVerticalSpace(18),
          const Divider(),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.breakfast_dining_outlined,
            text: 'Table Service',
            onTap: () {
              Navigator.pop(context);
              context.navigator.replaceAll(const [
                DashboardRoute(children: [TableRoute()]),
              ]);
            },
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.offline_bolt_outlined,
            text: 'Quick Order',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.delivery_dining_outlined,
            text: 'Delivery',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.soup_kitchen_outlined,
            text: 'Kitchen Display',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.watch_later_outlined,
            text: 'Clock Time',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.list_alt,
            text: 'Order List',
            onTap: () {
              Navigator.pop(context);
              context.navigator.replaceAll(const [
                DashboardRoute(children: [OrderListRoute()]),
              ]);
            },
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.bar_chart,
            text: 'Reports',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.light,
            text: 'Order Ready Screen',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.price_change_outlined,
            text: 'Price Checker',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.settings_outlined,
            text: 'Settings',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          DrawerCard(
            iconData: Icons.exit_to_app,
            text: 'Exit',
            onTap: () {},
          ),
          AppSpacing.setVerticalSpace(20),
          AppButton(
            text: 'KIOSK',
            textColor: AppColors.kcDarkText,
            backgroundColor: AppColors.kcDarkBorder,
            onPressed: () => Navigator.of(context).pop,
          ),
          AppSpacing.setVerticalSpace(20),
        ],
      ),
    );
  }
}
