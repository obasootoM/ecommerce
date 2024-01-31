import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap, 
    this.color,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: color,
          minimumSize: Size(400, 50)
        ), onPressed: onTap, child: Text(text,style: const TextStyle(color: Colors.black,fontSize: 20),));
  }
}
