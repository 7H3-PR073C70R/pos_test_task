import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:test_project/src/features/order/presentation/widgets/order_card.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';
import 'package:test_project/src/features/table/presentation/widgets/empty_state.dart';

@RoutePage()
class OrderListPage extends HookWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColors.kcPrimary,
          unselectedLabelColor: AppColors.kcBlack,
          indicatorColor: AppColors.kcPrimary,
          dividerColor: AppColors.kcBlack,
          tabs: const [
            Tab(
              text: 'UNPAID',
            ),
            Tab(
              text: 'PAID',
            ),
            Tab(
              text: 'CLOSED',
            ),
          ],
        ),
        AppSpacing.verticalSpaceSmall,
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              OrderUnpaid(),
              EmptyState(),
              EmptyState(),
            ],
          ),
        ),
      ],
    );
  }
}

class OrderUnpaid extends StatelessWidget {
  const OrderUnpaid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OrderBloc, OrderState, List<OrderEntity>>(
      bloc: context.read<OrderBloc>(),
      selector: (state) {
        return state.orders;
      },
      builder: (context, orders) {
        return ListView.separated(
          padding: EdgeInsets.all(16.radius),
          separatorBuilder: (context, _) => const Divider(),
          itemBuilder: (context, index) => OrderCard(
            itemNames:
                orders[index].table.orderItem.map((item) => item.name).toList(),
            paid: orders[index].paidAmount,
            totalPrice: orders[index].totalPrice,
            tableName: orders[index].table.name,
          ),
          itemCount: orders.length,
        );
      },
    );
  }
}
