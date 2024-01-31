import 'package:flutter/material.dart';

class RowProfile extends StatelessWidget {
  const RowProfile({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.icon,
    required this.previxIcon, 
    required this.onTap,
  });

  final double width;
  final double height;
  final String text;
  final IconData icon;
  final IconData previxIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: width * 0.1,
            height: height * 0.037,
            decoration: ShapeDecoration(
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Icon(previxIcon),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text,
            style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: onTap,
              child: Icon(
                icon,
                size: 15,
              ),
            ))
      ],
    );
  }
}
