import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/src/core/constants/app_spacing.dart';
import 'package:test_project/src/core/extensions/num_extension.dart';
import 'package:test_project/src/core/extensions/theme_extension.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/features/table/presentation/bloc/table_bloc.dart';
import 'package:test_project/src/shared/widgets/shrinkable_button.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

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
              const Text('Menu'),
              const Spacer(),
              const Icon(Icons.document_scanner_rounded),
              AppSpacing.horizontalSpaceSmall,
              const Icon(Icons.search_rounded),
            ],
          ),
          AppSpacing.verticalSpaceLarge,
          Expanded(
            child: BlocSelector<TableBloc, TableState, List<CategoryEntity>>(
              selector: (state) {
                return state.categories;
              },
              builder: (context, categories) {
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
                              TableEvent.updatedSelectedCategory(
                                category: categories[index],
                              ),
                            );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.height),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(12.radius),
                        ),
                        child: Center(
                          child: Text(
                            categories[index].name,
                            style: context.textTheme.bodySmall?.copyWith(),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: categories.length,
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
