import 'dart:developer';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? dropDownIndex;
  var dropDownList = ["Delete", "Change", "Remove", "Save"];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      icon: const Icon(Icons.expand_circle_down),
      dropdownColor: Colors.yellow,
      hint: const Text("select"),
      enableFeedback: true,
      iconSize: 16,
      borderRadius: BorderRadius.circular(16),
      style: const TextStyle(
        color: Colors.green,
        decoration: TextDecoration.underline,
        decorationColor: Colors.yellow,
      ),
      items: dropDownList
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList(),
      onChanged: (String? index) {
        log("index: $index");
        setState(() {
          dropDownIndex = index;
        });
      },
      value: dropDownIndex,
    );
  }
}
