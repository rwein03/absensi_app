import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class dropdownitem extends StatefulWidget {
  final List<String> listitem;
  final Function(String) onChanged;
  const dropdownitem({
    super.key,
    required this.listitem,
    required this.onChanged,
  });

  @override
  State<dropdownitem> createState() => _dropdownitemState();
}

class _dropdownitemState extends State<dropdownitem> {
  String? selectedValue;
  TextEditingController grade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      isExpanded: false,
      hint: const Text(
        'Select Grade',
        style: TextStyle(fontSize: 14),
      ),
      items: widget.listitem
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onChanged(value!);
      },
      dropdownSearchData: DropdownSearchData(searchController: grade),
      buttonStyleData: const ButtonStyleData(
        width: 120,
        padding: EdgeInsets.only(left: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
