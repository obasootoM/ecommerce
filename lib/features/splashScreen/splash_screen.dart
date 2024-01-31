import 'dart:async';
import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/features/splashScreen/splash_screen_01.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(
      seconds: 10,
    ), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen01())));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage(ConstImage.splash_screen01))),
    );
  }
}
