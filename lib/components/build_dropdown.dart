import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BuildDropdown extends StatefulWidget {
  final String hint;
  // final List<String>? items;
  final List<Map<String, String>>? itemsWithIcons;
  final String validator;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const BuildDropdown({
    super.key,
    required this.hint,
    // this.items,
    this.itemsWithIcons,
    required this.validator,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<BuildDropdown> createState() => _BuildDropdownState();
}

class _BuildDropdownState extends State<BuildDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 48;
    final double maxHeight = itemHeight * 3;

    return DropdownButtonFormField2<String>(
      dropdownStyleData: DropdownStyleData(
        maxHeight: maxHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        // iconSize: 28,
      ),
      menuItemStyleData: const MenuItemStyleData(height: itemHeight),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      value: selectedValue,
      hint: Text(widget.hint, style: TextStyle(fontFamily: 'Nunito')),
      // items: widget.items
      //     .map(
      //       (e) => DropdownMenuItem<String>(
      //         value: e,
      //         child: Text(
      //           e,
      //           style: TextStyle(
      //             fontFamily: 'Nunito',
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     )
      //     .toList(),
      items: widget.itemsWithIcons?.map((lang) {
        return DropdownMenuItem<String>(
          value: lang['name'],
          child: Row(
            children: [
              Image.asset(lang['icon']!, width: 24, height: 24),
              const SizedBox(width: 10),
              Text(lang['name']!),
            ],
          ),
        );
      }).toList(),
      validator: (String? value) {
        if (value == null) {
          return widget.validator;
        }
        return null;
      },
      onChanged: (String? value) {
        setState(() {
          selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
    );
  }
}
