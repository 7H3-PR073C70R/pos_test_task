import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/src/app/router/app_router.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';
import 'package:test_project/src/features/table/presentation/bloc/table_bloc.dart';
import 'package:test_project/src/shared/widgets/shrinkable_button.dart';

@RoutePage()
class TablePage extends HookWidget {
  const TablePage({super.key});

  static const routeName = '/table';

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 1);
    return Scaffold(
      body: BlocSelector<TableBloc, TableState, List<TableEntity>>(
        selector: (state) => state.tables,
        builder: (context, tables) {
          return Column(
            children: [
              TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColors.kcPrimary,
                unselectedLabelColor: AppColors.kcBlack,
                indicatorColor: AppColors.kcPrimary,
                dividerColor: AppColors.kcDisable,
                tabs: const [
                  Tab(
                    text: 'Default Room',
                  ),
                ],
              ),
              AppSpacing.verticalSpaceLarge,
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.horizontalSpacing,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final table = tables[index];
                          final isActive = table.itemCount > 0;
                          final timeDifference =
                              DateTime.now().difference(table.updatedAt);
                          return ShrinkableButton(
                            onTap: () {
                              if (isActive) return;
                              context.read<TableBloc>().add(
                                    TableEvent.updatedSelectedTable(table),
                                  );
                              context.router.push(const ViewTableRoute());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: !isActive
                                      ? AppColors.kcSuccessSecondary
                                      : Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12.radius),
                              ),
                              child: Column(
                                children: [
                                  AppSpacing.setVerticalSpace(12),
                                  Text(
                                    table.name,
                                    style:
                                        context.textTheme.bodyLarge?.copyWith(),
                                  ),
                                  const Spacer(),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.radius),
                                      bottomRight: Radius.circular(12.radius),
                                    ),
                                    child: Container(
                                      height: 12.height,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.radius,
                                      ),
                                      color: !isActive
                                          ? AppColors.kcSuccessSecondary
                                          : Colors.grey,
                                      child: Row(
                                        mainAxisAlignment: isActive
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${table.itemCount}/${table.itemCount + 4}',
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(),
                                          ),
                                          if (isActive)
                                            Text(
                                              '${timeDifference.inMinutes}:'
                                              '${timeDifference.inSeconds}',
                                              style: context.textTheme.bodySmall
                                                  ?.copyWith(),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: tables.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
