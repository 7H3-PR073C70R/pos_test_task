import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';
import 'package:test_project/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:test_project/src/features/order/presentation/widgets/card_button.dart';
import 'package:test_project/src/features/table/presentation/bloc/table_bloc.dart';
import 'package:test_project/src/features/table/presentation/widgets/category_tab.dart';
import 'package:test_project/src/features/table/presentation/widgets/empty_state.dart';
import 'package:test_project/src/features/table/presentation/widgets/menu_tab.dart';
import 'package:test_project/src/shared/widgets/shrinkable_button.dart';

@RoutePage()
class ViewTablePage extends HookWidget {
  const ViewTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        final table = state.selectedTable;
        final totalAmount = table?.orderItem.fold<num>(
          0,
          (previous, item) => previous + item.price,
        );
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${state.selectedTable?.name} ${totalAmount?.toAmount ?? '0.00'}',
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.width),
                child: const Icon(Icons.more_vert_sharp),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.7,
                                    horizontal: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${table?.itemCount ?? 0}',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                          color: AppColors.kcDarkText,
                                          fontSize: 9.5.fontSize,
                                        ),
                                      ),
                                      Text(
                                        totalAmount?.toAmount ?? '0.00',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                          color: AppColors.kcPrimary,
                                          fontSize: 9.5.fontSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: AppColors.kcPrimary,
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              style: context.textTheme.bodySmall,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.width,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: OptionCard(
                              iconData: Icons.add,
                              fill: true,
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: OptionCard(
                              iconData: Icons.sd_card,
                              iconColor: Colors.black87,
                              onTap: () {
                                context
                                    .read<TableBloc>()
                                    .add(const TableEvent.saveTable());
                                context
                                    .read<OrderBloc>()
                                    .add(const OrderEvent.started());
                                Navigator.pop(context);
                              },
                              fill: false,
                            ),
                          ),
                          Expanded(
                            child: OptionCard(
                              iconData: Icons.local_printshop_outlined,
                              iconColor: Colors.grey.shade500,
                              fill: false,
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: OptionCard(
                              iconData: Icons.credit_card_outlined,
                              iconColor: Colors.black87,
                              fill: false,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: table!.itemCount > 0
                            ? ListView.builder(
                                itemBuilder: (_, index) => ItemCard(
                                  name: table.orderItem[index].name,
                                  price: table.orderItem[index].price,
                                ),
                                itemCount: table.itemCount,
                              )
                            : const EmptyState(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state.selectedCategory == null
                      ? const MenuTab()
                      : CategoryTab(
                          name: state.selectedCategory?.name ?? '',
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({
    required this.iconData,
    required this.fill,
    required this.onTap,
    this.iconColor,
    super.key,
  });
  final IconData iconData;
  final bool fill;
  final Color? iconColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ShrinkableButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.2)),
          color: fill ? Colors.blue.withOpacity(.1) : null,
        ),
        child: Center(
          child: Icon(
            iconData,
            color: fill ? Colors.blue : iconColor,
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.name,
    required this.price,
    super.key,
  });

  final String name;
  final num price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              const VerticalDivider(
                color: AppColors.kcPrimary,
                width: 10,
                thickness: 2,
              ),
              AppSpacing.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1.0*',
                              style: context.textTheme.titleMedium!.copyWith(
                                color: AppColors.kcPrimary,
                              ),
                            ),
                            AppSpacing.horizontalSpaceSmall,
                            Text(
                              name,
                              style: context.textTheme.titleMedium,
                            ),
                            const Spacer(),
                            Text(
                              price.toAmount,
                              style: context.textTheme.titleMedium!.copyWith(
                                color: AppColors.kcPrimary,
                              ),
                            ),
                          ],
                        ),
                        showTrailingIcon: false,
                        collapsedShape: Border.all(color: Colors.transparent),
                        children: [
                          Row(
                            children: [
                              CardButton(
                                text: 'Sales TAX +%7.5',
                                color: Colors.grey.shade600,
                                padding: 5,
                                fontSize: 10.fontSize,
                                radius: 20,
                                onTap: () {},
                              ),
                              AppSpacing.horizontalSpaceTiny,
                              CardButton(
                                text: 'SVC +%4.0',
                                color: Colors.grey.shade600,
                                padding: 5,
                                fontSize: 10.fontSize,
                                radius: 20,
                                onTap: () {},
                              ),
                            ],
                          ),
                          AppSpacing.verticalSpaceSmall,
                          Row(
                            children: [
                              CardButton(
                                text: '',
                                color: AppColors.kcBlack,
                                icon: Icons.local_fire_department,
                                padding: 5,
                                onTap: () {},
                              ),
                              AppSpacing.horizontalSpaceTiny,
                              CardButton(
                                text: '',
                                color: AppColors.kcBlack,
                                icon: Icons.pause,
                                padding: 5,
                                onTap: () {},
                              ),
                              AppSpacing.horizontalSpaceTiny,
                              CardButton(
                                text: '',
                                color: AppColors.kcBlack,
                                icon: Icons.access_time,
                                padding: 5,
                                onTap: () {},
                              ),
                              AppSpacing.horizontalSpaceMedium,
                              CardButton(
                                text: '%',
                                color: AppColors.kcSuccess,
                                icon: Icons.percent,
                                padding: 5,
                                onTap: () {},
                              ),
                              AppSpacing.horizontalSpaceTiny,
                              CardButton(
                                text: 'Note',
                                color: AppColors.kcPrimary,
                                padding: 5,
                                onTap: () {},
                              ),
                              AppSpacing.horizontalSpaceTiny,
                              CardButton(
                                text: '',
                                color: AppColors.kcDarkText,
                                padding: 5,
                                icon: Icons.delete_outline_outlined,
                                onTap: () {},
                              ),
                              AppSpacing.horizontalSpaceSmall,
                              const Text('1.0'),
                              AppSpacing.horizontalSpaceSmall,
                              CardButton(
                                text: '',
                                color: AppColors.kcDarkText,
                                padding: 5,
                                icon: Icons.add,
                                onTap: () {},
                              ),
                            ],
                          ),
                          AppSpacing.verticalSpaceSmall,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
