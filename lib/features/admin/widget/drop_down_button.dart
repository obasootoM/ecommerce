import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String catgory = 'Bags';
  final List<String> productCategory = [
    'Bags',
    'Clothes',
    'New Arrival',
    'Shoes',
    'Electronics',
    'Jewelry'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down),
            value: catgory,
            onChanged: (String? value) {
              setState(() {
                catgory = value!;
              });
            },
            items: productCategory.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList()),
      ),
    );
  }
}
