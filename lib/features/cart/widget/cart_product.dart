import 'package:ecommerce/features/cart/service/cart_service.dart';
import 'package:ecommerce/features/productDetails/service/product_service.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({super.key, required this.index});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  ProductService productService = ProductService();
  CartService cartService = CartService();
  void increaseQuantity(Product product) {
    productService.addTocart(context: context, product: product);
  }

  void decreaseQuantity(Product product) {
    cartService.deleteCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>().user.cart[widget.index];
    final product = Product.fromMap(provider['product']);
    final quantity = provider['quantity'];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: ShapeDecoration(
                shadows: const [BoxShadow(offset: Offset(0.1, 0.1))],
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.cover,
                  width: 135,
                  height: 135,
                ),
                Column(
                  children: [
                    Container(
                      width: 235,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontSize: 16),
                        maxLines: 2,
                      ),
                    ),
                    // Container(
                    //   width: 235,
                    //   padding: const EdgeInsets.only(left: 10, top: 5),
                    //   child: RatingBars(star: aveRating),
                    // ),
                    Container(
                        width: 235,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          maxLines: 2,
                        )),
                    Container(
                        width: 235,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: const Text(
                          'Eligible for shipping',
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        )),
                    Container(
                        width: 235,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: const Text(
                          'in Stock',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 17),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                          style: BorderStyle.solid))),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => decreaseQuantity(product),
                    child: Container(
                      color: Colors.grey[400],
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    child: Text(quantity.toString()),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  InkWell(
                    onTap: () => increaseQuantity(product),
                    child: Container(
                      color: Colors.grey[400],
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
