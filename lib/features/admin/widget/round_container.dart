import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/const/utilis.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatefulWidget {
  const RoundedContainer({super.key});

  @override
  State<RoundedContainer> createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {
  void pickImage() async {
    var file = await pickFile();
    setState(() {
      images = file;
    });
  }

  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return images.isNotEmpty
        ? CarouselSlider(
            items: images.map((e) {
              return Builder(
                  builder: (BuildContext context) => Image.file(
                        e,
                        fit: BoxFit.cover,
                        height: 200,
                      ));
            }).toList(),
            options: CarouselOptions(viewportFraction: 1,height: 200))
        : Container(
            width: width * 0.9,
            height: height * 0.2,
            decoration: ShapeDecoration(
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child:
                        const Icon(Icons.folder, size: 50, color: Colors.grey)),
                const Text(
                  'select product images',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ));
  }
}
