import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context).user;
    return Container(
        width: width * 0.9,
        height: height * 0.1,
        decoration: ShapeDecoration(
            color: Colors.white,
            shadows: const [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.black,
                blurRadius: 1,
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: width * 0.2,
              height: height * 0.08,
              decoration: ShapeDecoration(
                  color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 17,
                ),
                RichText(
                    text:  TextSpan(
                        text: '${provider.Name}\n',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: '${provider.Email}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.normal))
                    ]))
              ],
            )
          ],
        ));
  }
}
