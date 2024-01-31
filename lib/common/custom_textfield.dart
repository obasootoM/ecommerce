import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    this.obscure = false,
    required this.text,
    this.onTap,
    this.sufficIcon, 
    this.maxLine = 1,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscure;
  final String text;
  final VoidCallback? onTap;
  final Widget? sufficIcon;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        maxLines: maxLine,
        onTap: onTap,
        style: const TextStyle(color: Colors.black),
        obscureText: obscure,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: sufficIcon,
          hintText: text,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                color: Colors.black,),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(
                borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.black12,),
                borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                color: Colors.black,),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
