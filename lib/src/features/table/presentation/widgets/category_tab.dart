import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/src/core/constants/app_colors.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/features/table/presentation/bloc/table_bloc.dart';
import 'package:test_project/src/shared/widgets/shrinkable_button.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: 50.width,
              child: const Divider(
                color: Colors.grey,
                thickness: 3,
              ),
            ),
          ),
          AppSpacing.verticalSpaceLarge,
          Row(
            children: [
              const Icon(Icons.list_rounded),
              AppSpacing.horizontalSpaceSmall,
              IconButton(
                onPressed: () {
                  context.read<TableBloc>().add(
                        const TableEvent.updatedSelectedCategory(),
                      );
                },
                icon: const Icon(Icons.arrow_back),
              ),
              AppSpacing.horizontalSpaceSmall,
              Text(name),
              const Spacer(),
              const Icon(Icons.document_scanner_rounded),
              AppSpacing.horizontalSpaceSmall,
              const Icon(Icons.search_rounded),
            ],
          ),
          AppSpacing.verticalSpaceLarge,
          Expanded(
            child: BlocSelector<TableBloc, TableState, List<MenuItemEntity>>(
              selector: (state) {
                return state.menuItems;
              },
              builder: (context, menuItems) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 55,
                  ),
                  itemBuilder: (context, index) {
                    return ShrinkableButton(
                      onTap: () {
                        context.read<TableBloc>().add(
                              TableEvent.addItemToTable(
                                menuItems[index],
                              ),
                            );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12.radius),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.radius),
                              child: Image.network(
                                menuItems[index].image,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.image,
                                ),
                              ),
                            ),
                            AppSpacing.horizontalSpaceSmall,
                            Expanded(
                              child: Text(
                                menuItems[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.bodySmall?.copyWith(),
                              ),
                            ),
                            AppSpacing.horizontalSpaceSmall,
                            Text(
                              menuItems[index].price.toAmount,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: AppColors.kcPrimary),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: menuItems.length,
                );
              },
            ),
          ),
          AppSpacing.verticalSpaceLarge,
        ],
      ),
    );
  }
}
