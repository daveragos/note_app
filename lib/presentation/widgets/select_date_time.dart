import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:note_app/presentation/widgets/costum_form_field.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({
    super.key,
    required this.dateController,
    required this.timeController,
  });

  final TextEditingController dateController;
  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CostumFormField(
            controller: dateController,
            title: 'Date',
            readOnly: true,
            hintText: 'Enter Date',
            suffixIcon: IconButton(
                onPressed: () => _selectDate(context),
                icon: const Icon(FontAwesomeIcons.calendar)),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CostumFormField(
            controller: timeController,
            title: 'Time',
            readOnly: true,
            hintText: 'Enter Time',
            suffixIcon: IconButton(
                onPressed: () => _selectTime(context),
                icon: const FaIcon(FontAwesomeIcons.clock)),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      timeController.text = pickedTime.format(context);
    }
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      dateController.text = DateFormat.yMMMd().format(pickedDate);
    }
  }
}
