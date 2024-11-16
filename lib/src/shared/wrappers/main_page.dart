import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [],
      animationCurve: Curves.easeInCubic,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBuilder: (_, tabsRouter) {
        return const SizedBox.shrink();
      },
    );
  }
}
