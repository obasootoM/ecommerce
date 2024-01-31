import 'package:ecommerce/features/profile/widget/row_profile.dart';
import 'package:ecommerce/features/profile/widget/setting_screen.dart';
import 'package:flutter/material.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width * 0.9,
      height: height * 0.4,
      decoration: ShapeDecoration(
          color: Colors.white,
          shadows: const [
            BoxShadow(
              offset: Offset(1, 1),
              color: Colors.black,
              blurRadius: 1,
            )
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Column(
        children: [
          RowProfile(
            width: width,
            height: height,
            text: 'Personal Details',
            icon: Icons.arrow_forward_ios,
            previxIcon: Icons.person,
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          RowProfile(
            width: width,
            height: height,
            text: 'My orders',
            icon: Icons.arrow_forward_ios,
            previxIcon: Icons.badge,
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          RowProfile(
            width: width,
            height: height,
            text: 'My favourites',
            icon: Icons.arrow_forward_ios,
            previxIcon: Icons.favorite,
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          RowProfile(
            width: width,
            height: height,
            text: 'Shopping address',
            icon: Icons.arrow_forward_ios,
            previxIcon: Icons.bus_alert,
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          RowProfile(
            width: width,
            height: height,
            text: 'My Card',
            icon: Icons.arrow_forward_ios,
            previxIcon: Icons.card_giftcard,
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          RowProfile(
            width: width,
            height: height,
            text: 'Settings',
            icon: Icons.arrow_forward_ios,
            previxIcon: Icons.settings,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingScreen()));
            },
          ),
        ],
      ),
    );
  }
}
