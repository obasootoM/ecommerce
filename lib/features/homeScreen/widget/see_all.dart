import 'package:ecommerce/common/loading.dart';
import 'package:ecommerce/features/admin/service/admin_service.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  List<Product>? product;
  AdminService adminService = AdminService();
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
    return product == null ? const Loading(): Column(
      children: [
        Expanded(
            child: GridView.builder(
                itemCount: product!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final products = product![index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: width * 0.5,
                    height: height * 0.3,
                    decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Image.network(products.images[0],fit: BoxFit.cover,),
                  );
                }))
      ],
    );
  }
}
