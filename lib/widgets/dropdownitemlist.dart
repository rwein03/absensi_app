import 'package:absensi_app/AppStyle.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownItemList extends StatefulWidget {
  final List<String?> listitem;
  final String titlebox;
  final Function(String) onChanged;
  final bool isrefreshed;
  final Function()? onRefreshed;
  const DropdownItemList(
      {super.key,
      required this.listitem,
      required this.titlebox,
      required this.onChanged,
      this.isrefreshed = false,
      this.onRefreshed});

  @override
  State<DropdownItemList> createState() => _DropdownItemListState();
}

class _DropdownItemListState extends State<DropdownItemList> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 5,
      children: [
        Text(
          widget.titlebox,
          style: AppStyle.smalltitle,
        ),
        Row(
          spacing: 5,
          children: [
            Flexible(
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                hint: Text(
                  widget.titlebox,
                  style: TextStyle(fontSize: 14),
                ),
                items: widget.listitem
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select ${widget.titlebox}.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  widget.onChanged(value!);
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            Visibility(
                visible: widget.isrefreshed,
                child: IconButton(
                    onPressed: widget.onRefreshed,
                    icon: Icon(Icons.refresh_outlined)))
          ],
        ),
      ],
    );
  }
}
