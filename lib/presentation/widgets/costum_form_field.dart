import 'package:flutter/material.dart';
import 'package:note_app/app/utils/extensions.dart';

class CostumFormField extends StatelessWidget {
  const CostumFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.maxLine,
    this.suffixIcon,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final int? maxLine;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            readOnly: readOnly,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              border: const OutlineInputBorder(),
              labelText: hintText,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $title';
              }
              return null;
            },
            maxLines: maxLine,
          ),
        ),
      ],
    );
  }
}
