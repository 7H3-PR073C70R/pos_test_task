import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/src/app/router/app_router.dart';
import 'package:test_project/src/core/set_up/bloc/set_up_bloc.dart';
import 'package:test_project/src/core/themes/app_theme.dart';
import 'package:test_project/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:test_project/src/features/table/presentation/bloc/table_bloc.dart';
import 'package:test_project/src/l10n/l10n.dart';
import 'package:test_project/src/shared/widgets/dismiss_keyboard.dart';

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SetUpBloc(),
              lazy: false,
            ),
            BlocProvider(
              create: (context) => TableBloc(),
            ),
            BlocProvider(
              create: (context) => OrderBloc(),
            ),
          ],
          child: MaterialApp.router(
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: appRouter.config(),
          ),
        ),
      ),
    );
  }
}
