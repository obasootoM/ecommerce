import 'package:ecommerce/features/profile/widget/row_profile.dart';
import 'package:flutter/material.dart';

class RemainProfile extends StatelessWidget {
  const RemainProfile({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: width * 0.9,
      height: height * 0.25,
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: const [
          BoxShadow(offset: Offset(1,1),
          color: Colors.black,
          blurRadius: 1,
      
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10))),
          child: Column(children: [
            RowProfile(
              width: width, 
              height: height, 
              text: 'FAQs', 
              icon: Icons.arrow_forward_ios, 
              previxIcon: Icons.privacy_tip,
              onTap: (){},
              ),
            RowProfile(
              width: width, 
              height: height, 
              text: 'Privacy Policy', 
              icon: Icons.arrow_forward_ios, 
              previxIcon: Icons.privacy_tip_outlined,
              onTap: (){},
              ),
          ]),
    );
  }
}


