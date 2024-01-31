import 'package:ecommerce/const/const.dart';
import 'package:flutter/material.dart';

class Pageview2 extends StatelessWidget {
  const Pageview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(ConstImage.frame4),fit: BoxFit.cover),
        color: Colors.transparent),
    );
  }
}