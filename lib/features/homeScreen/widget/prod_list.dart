import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/features/homeScreen/screen/category_screen.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  void navigateToCategoryScreen(BuildContext context, String category) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryScreen(category: category)));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
        height: height * 0.1,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ConstImage.productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    navigateToCategoryScreen(
                        context, ConstImage.productList[index]['title']!);
                  },
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.08,
                    decoration: ShapeDecoration(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadows: const [
                          BoxShadow(offset: Offset(1, 1), blurRadius: 1)
                        ]),
                    child: Column(children: [
                      Text(
                        ConstImage.productList[index]['title'],
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Icon(ConstImage.productList[index]['icon'])
                    ]),
                  ),
                ),
              );
            }));
  }
}
