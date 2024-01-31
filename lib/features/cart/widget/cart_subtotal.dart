import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSubTotal extends StatelessWidget {
  const CartSubTotal({super.key});

  @override
  Widget build(BuildContext context) {
    int sum = 0;
    final provider = Provider.of<AuthProvider>(context).user;
    provider.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Container(
      margin:const  EdgeInsets.all(10),
      child: Row(children: [
        const Text('SubTotal',style: TextStyle(fontSize: 20),),
        Text(' \$${sum}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
      ]),
    );
  }
}
