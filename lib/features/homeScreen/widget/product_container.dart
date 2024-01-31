import 'package:ecommerce/common/loading.dart';
import 'package:ecommerce/features/admin/service/admin_service.dart';
import 'package:ecommerce/features/productDetails/screen/product_screen.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatefulWidget {
  const ProductContainer({super.key});

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  List<Product>? product;
  AdminService adminService = AdminService();
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  void getProduct() async {
    product = await adminService.getProduct(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return product == null
        ? const Loading()
        : Container(
            height: height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final products = product![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(product: products)));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: width * 0.45,
                            height: height * 0.2,
                            decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Image.network(
                              products.images[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            ' ${products.name}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${products.description}',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          Text(
                            '\$${products.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
    // Expanded(
    //     child: GridView.builder(
    //         shrinkWrap: true,
    //         itemCount: 10,
    //         scrollDirection: Axis.vertical,
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //         ),
    //         itemBuilder: (context, index) {
    //           return Container(
    //             margin: const EdgeInsets.all(10),
    //             width: width * 0.5,
    //             height: height * 0.3,
    //             decoration: ShapeDecoration(
    //                 color: Colors.grey,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(20))),

    //           );
    //         }));
  }
}
