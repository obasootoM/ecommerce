import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context).user;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.27,
      child: ListView.builder(
        itemCount: ConstImage.categoryList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
              width: width * 0.8,
              height: height * 0.27,
              decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 212, 211, 211),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  shadows: const [
                    BoxShadow(offset: Offset(0.4, 0.4), blurRadius: 0.0),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            text:
                                "${ConstImage.categoryList[index]['title']}% off \n",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: const [
                              TextSpan(
                                  text: 'on Everything today',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal))
                            ]),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text:  TextSpan(
                            text: 'with code : ${provider.Id}',
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: width * 0.3,
                        height: height * 0.06,
                        decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Center(
                            child: Text(
                          'Get Now',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
