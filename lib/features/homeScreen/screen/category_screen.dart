import 'package:ecommerce/common/loading.dart';
import 'package:ecommerce/features/homeScreen/service/home_service.dart';
import 'package:ecommerce/features/productDetails/screen/product_screen.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});
  final String category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product>? product;
  HomeService service = HomeService();

  void initState() {
    super.initState();
    fetchPoductCategory();
  }

  void fetchPoductCategory() async {
    product = await service.fetchProductCategory(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.3,
        title: Text(
          widget.category,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: product == null
          ? const Loading()
          : Column(children: [
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'keep Shopping for ${widget.category}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 170,
                child: GridView.builder(
                    itemCount: product!.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.4),
                    itemBuilder: (context, index) {
                      final productList = product![index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductScreen(
                                            product: productList)));
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(productList.images[0]),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                top: 5, left: 0, right: 15),
                            child: Text(
                              productList.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      );
                    }),
              )
            ]),
    );
  }
}
