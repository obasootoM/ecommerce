import 'package:flutter/material.dart';

class SingleImages extends StatelessWidget {
  const SingleImages({super.key, 
  required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Container(
          width: 180,
          child: Image.network(
            image,
            width: 200,
            fit: BoxFit.contain,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
