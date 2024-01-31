import 'package:ecommerce/const/rating_bar.dart';
import 'package:ecommerce/features/productDetails/screen/product_screen.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double aveRating = 0;
    if (totalRating != 0) {
      aveRating = totalRating / product.rating!.length;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(product: product)));
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.fitHeight,
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
                    Container(
                      width: 235,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child:  RatingBars(star: aveRating),
                    ),
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
          )
        ],
      ),
    );
  }
}
