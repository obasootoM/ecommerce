import 'package:ecommerce/common/loading.dart';
import 'package:ecommerce/features/admin/screen/add_product_screen.dart';
import 'package:ecommerce/features/admin/service/admin_service.dart';
import 'package:ecommerce/features/admin/widget/single_images.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Product>? product;
  final AdminService adminService = AdminService();
  void navigateScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddProductScreen()));
  }

  void initState() {
    super.initState();
    getProduct();
  }

  void deleteProduct(Product products, int index) {
    adminService.deleteProduct(
        product: products,
        context: context,
        success: () {
          product!.removeAt(index);
          setState(() {});
        });
  }

  void getProduct() async {
    product = await adminService.getProduct(context);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              elevation: 0.3,
              title: const Text('Fashion'),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Admin',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            body: GridView.builder(
                itemCount: product!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final products = product![index];
                  return Column(
                    children: [
                      SizedBox(
                          height: 120,
                          child: SingleImages(
                            image: products.images[0],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              products.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )),
                          IconButton(
                              onPressed: () {
                                deleteProduct(products, index);
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton.small(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                tooltip: 'Add Product',
                child: const Icon(Icons.add),
                onPressed: () {
                  navigateScreen();
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
