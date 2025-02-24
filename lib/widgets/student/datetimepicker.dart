import 'package:absensi_app/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datetimepicker extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  const Datetimepicker({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  State<Datetimepicker> createState() => _DatetimepickerState();
}

class _DatetimepickerState extends State<Datetimepicker> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );

    setState(() {
      selectedDate = pickedDate;
      widget.controller.text = DateFormat('yyyy-MM-dd').format(pickedDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 5,
      children: [
        Text(
          widget.title,
          style: AppStyle.smalltitle,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please select date";
            }
            return null;
          },
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () => _selectDate(), icon: Icon(Icons.date_range)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )
      ],
    );
  }
}
