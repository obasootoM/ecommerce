import 'package:ecommerce/common/custom_button.dart';
import 'package:ecommerce/features/address/screen/address_screen.dart';
import 'package:ecommerce/features/cart/widget/cart_product.dart';
import 'package:ecommerce/features/cart/widget/cart_subtotal.dart';
import 'package:ecommerce/features/homeScreen/search/screen/search_screen.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToScreen(String search) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SearchScreen(search: search)));
  }

  void navigateToAddress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddresScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>().user;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 0.3,
          title: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: width * 0.7,
                  height: height * 0.08,
                  decoration: ShapeDecoration(
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'search',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10))),
                  ))),
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(children: [
              const CartSubTotal(),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'proceed to buy (${provider.cart.length} items)',
                onTap: navigateToAddress,
                color: Colors.yellow,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              ListView.builder(
                  itemCount: provider.cart.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartProduct(index: index);
                  })
            ]),
      ),
    );
  }
}
