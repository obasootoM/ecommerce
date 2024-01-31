import 'package:flutter/material.dart';

class NewRow extends StatelessWidget {
  const NewRow({
    super.key,
    required this.width,
    required this.text, 
    required this.onTap,
  });

  final double width;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              'See All',
              style: TextStyle(fontSize: 17),
            ),
          ),
        )
      ],
    );
  }
}
