import 'package:ecommerce/common/loading.dart';
import 'package:ecommerce/features/homeScreen/search/service/service.dart';
import 'package:ecommerce/features/homeScreen/search/widget/search_container.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.search});
  final String search;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? product;
  SearchService searchService = SearchService();
  void searchScreen() async {
    product = await searchService.searchCategory(
        context: context, query: widget.search);
    setState(() {});
  }

  void initState() {
    super.initState();
    searchScreen();
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
        body: product == null
            ? const Loading()
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: product!.length,
                        itemBuilder: (context, index) {
                          return SearchContainer(product: product![index]);
                        }),
                  ),
                ],
              ));
  }
}
