import 'package:ecommerce/const/const.dart';
import 'package:flutter/material.dart';

class PageView1 extends StatelessWidget {
  const PageView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(ConstImage.frame3),fit: BoxFit.cover),
        color: Colors.transparent),
    );
  }
}