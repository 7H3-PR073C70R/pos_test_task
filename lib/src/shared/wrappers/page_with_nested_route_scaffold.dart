import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PageWithNestedRouteScaffold extends StatelessWidget {
  const PageWithNestedRouteScaffold({
    required this.body,
    super.key,
    this.appBar,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Navigator.of(context).pop();
      },
      child: AutoRouter(
        inheritNavigatorObservers: false,
        placeholder: (context) => body,
      ),
    );
  }
}
