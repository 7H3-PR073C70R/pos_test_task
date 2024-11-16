import 'package:flutter/material.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';
import 'package:test_project/src/features/order/presentation/widgets/card_button.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    required this.tableName,
    required this.itemNames,
    required this.totalPrice,
    required this.paid,
    super.key,
  });

  final String tableName;
  final List<String> itemNames;
  final num totalPrice;
  final num paid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.verticalSpaceLarge,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#45 (quick order)',
              style: context.textTheme.titleMedium,
            ),
            Text(
              '$tableName (Default room)',
              style: context.textTheme.titleMedium!.copyWith(
                color: AppColors.kcPrimary,
              ),
            ),
          ],
        ),
        Text(
          'Any Client',
          style: context.textTheme.titleMedium,
        ),
        Text(
          'Left to pay ${(totalPrice - paid).toAmount} of'
          ' total ${totalPrice.toAmount}',
          style: context.textTheme.titleMedium,
        ),
        AppSpacing.verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('09:42'),
            Text(
              'Slyvia Do',
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
        AppSpacing.verticalSpaceSmall,
        IntrinsicHeight(
          child: Row(
            children: [
              const VerticalDivider(
                color: AppColors.kcPrimary,
                width: 10,
                thickness: 2,
              ),
              AppSpacing.horizontalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  itemNames.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.only(bottom: index == 2 ? 1 : 10.height),
                    child: Text('1.0 * ${itemNames[index]}'),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppSpacing.verticalSpaceMedium,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardButton(
              text: 'Info',
              color: AppColors.kcButton,
              onTap: () {},
            ),
            AppSpacing.horizontalSpaceTiny,
            CardButton(
              text: 'Pay',
              color: AppColors.kcPrimary,
              onTap: () {},
            ),
            AppSpacing.horizontalSpaceTiny,
            CardButton(
              text: 'Print',
              color: AppColors.kcSuccess,
              onTap: () {},
            ),
            AppSpacing.horizontalSpaceTiny,
            CardButton(
              text: 'Void',
              color: AppColors.kcDarkText,
              onTap: () {},
            ),
          ],
        ),
        AppSpacing.verticalSpaceLarge,
      ],
    );
  }
}
