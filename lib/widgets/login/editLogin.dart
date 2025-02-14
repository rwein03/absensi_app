import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditloginWidget extends StatefulWidget {
  EditloginWidget({
    super.key,
    required this.labelText,
    this.isPassword = false,
    required this.icon,
    required this.controller,
  });

  final String labelText;
  final bool isPassword;
  final IconData icon;
  final TextEditingController controller;

  @override
  State<EditloginWidget> createState() => _EditloginWidgetState();
}

class _EditloginWidgetState extends State<EditloginWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
