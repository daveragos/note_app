import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:note_app/app/utils/extensions.dart';
import 'package:note_app/domain/entity/todo_category.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: category.color.withOpacity(0.5),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      category.icon,
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
