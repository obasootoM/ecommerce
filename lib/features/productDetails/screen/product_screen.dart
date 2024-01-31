import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/custom_button.dart';
import 'package:ecommerce/const/rating_bar.dart';
import 'package:ecommerce/features/homeScreen/search/screen/search_screen.dart';
import 'package:ecommerce/features/productDetails/service/product_service.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});
  final Product product;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  void navigateToScreen(String search) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SearchScreen(search: search)));
  }

  void addToCart()  {
    productService.addTocart(context: context, product: widget.product);
  }

  final ProductService productService = ProductService();
  double minRating = 0;
  double aveRating = 0;
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<AuthProvider>(context, listen: false).user.Id) {
        minRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      aveRating = totalRating / widget.product.rating!.length;
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(widget.product.id), RatingBars(star: aveRating)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              widget.product.name,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          CarouselSlider(
              items: widget.product.images.map((e) {
                return Builder(
                    builder: (BuildContext context) => Image.network(
                          e,
                          fit: BoxFit.cover,
                          height: 200,
                          width: width * 1,
                        ));
              }).toList(),
              options: CarouselOptions(viewportFraction: 1, height: 300)),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width * 1,
            height: height * 0.01,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan(
                    text: 'Deal of the day:',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: '  \$${widget.product.price} \n',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  )
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.product.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            width: width * 1,
            height: height * 0.01,
            color: Colors.grey[200],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CustomButton(
            onTap: () {},
            text: 'Buy now',
            color: Colors.yellow,
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: CustomButton(
            onTap: addToCart,
            text: 'Add to Cart',
            color: const Color.fromARGB(255, 255, 147, 59),
          )),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: width * 1,
            height: height * 0.01,
            color: Colors.grey[200],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Rate The Product',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingBar.builder(
                  itemSize: 25,
                  initialRating: minRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) {
                    return const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 170, 59),
                    );
                  },
                  onRatingUpdate: (rating) {
                    productService.ratingProduct(
                        context: context,
                        product: widget.product,
                        rating: rating);
                  }))
        ],
      )),
    );
  }
}
