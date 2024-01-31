import 'package:ecommerce/features/profile/widget/image_profile.dart';
import 'package:ecommerce/features/profile/widget/personal_profile.dart';
import 'package:ecommerce/features/profile/widget/remain_profile.dart';
import 'package:ecommerce/features/profile/widget/setting_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: const Icon(Icons.access_alarm),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()));
                  },
                  child: const Icon(Icons.settings)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ImageProfile(width: width, height: height),
              ),
              const SizedBox(
                height: 20,
              ),
              PersonalProfile(width: width, height: height),
              const SizedBox(
                height: 20,
              ),
              RemainProfile(width: width, height: height)
            ],
          ),
        ));
  }
}
