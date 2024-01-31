import 'dart:async';

import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/features/auth/screens/auth_sign_in.dart';
import 'package:flutter/material.dart';

class PageView3 extends StatefulWidget {
  const PageView3({super.key});

  @override
  State<PageView3> createState() => _PageView3State();
}

class _PageView3State extends State<PageView3> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AuthSignIn())));
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ConstImage.frame5,
              ),
              fit: BoxFit.cover),
          color: Colors.transparent),
    );
  }
}
