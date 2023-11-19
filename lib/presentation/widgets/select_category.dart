import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:note_app/app/utils/extensions.dart';
import 'package:note_app/domain/entity/todo_category.dart';
import 'package:note_app/presentation/providers/module.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categories = TaskCategory.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Categories', style: context.textTheme.titleLarge),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    ref.read(selectedCategoryProvider.notifier).state =
                        category;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: category.color.withOpacity(0.3),
                    ),
                    child: Icon(
                      category.icon,
                      color: category == selectedCategory
                          ? context.colorScheme.primary
                          : category.color,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(10),
            ),
          )
        ],
      ),
    );
  }
}
