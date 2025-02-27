import 'package:absensi_app/AppStyle.dart';
import 'package:flutter/material.dart';

class EditTitleWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool obstruct;
  final TextEditingController controller;
  const EditTitleWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.obstruct,
      required this.controller});

  @override
  State<EditTitleWidget> createState() => _EditTitleWidgetState();
}

class _EditTitleWidgetState extends State<EditTitleWidget> {
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
              return "Please fill ${widget.title}";
            }
            return null;
          },
          obscureText: widget.obstruct,
          controller: widget.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(widget.icon),
              hintText: widget.title,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        ),
      ],
    );
  }
}
