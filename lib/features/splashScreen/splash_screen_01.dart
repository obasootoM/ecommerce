import 'dart:async';

import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/features/splashScreen/page_views.dart';
import 'package:flutter/material.dart';

class SplashScreen01 extends StatefulWidget {
  const SplashScreen01({super.key});

  @override
  State<SplashScreen01> createState() => _SplashScreen01State();
}

class _SplashScreen01State extends State<SplashScreen01> {
   @override
  void initState() {
    Timer(const Duration(
      seconds: 10,
    ), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PageViewScreen())));
 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage(ConstImage.splash_screen02))),
    );
  }
}