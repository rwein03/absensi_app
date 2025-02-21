import 'package:flutter/material.dart';

class editStudentWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool obstruct;
  final TextEditingController controller;
  const editStudentWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.obstruct,
      required this.controller});

  @override
  State<editStudentWidget> createState() => _editStudentWidgetState();
}

class _editStudentWidgetState extends State<editStudentWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obstruct,
      controller: widget.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          label: Text(widget.title),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
