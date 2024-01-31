import 'package:ecommerce/features/homeScreen/search/screen/search_screen.dart';
import 'package:ecommerce/features/homeScreen/widget/banner.dart';
import 'package:ecommerce/features/homeScreen/widget/new_row.dart';
import 'package:ecommerce/features/homeScreen/widget/prod_list.dart';
import 'package:ecommerce/features/homeScreen/widget/product_container.dart';
import 'package:ecommerce/features/homeScreen/widget/see_all.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToScreen(String search) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SearchScreen(search: search)));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundColor: Colors.grey),
          ),
          title: Text.rich(
            TextSpan(text: 'Hi, ${user.Name}\n', children: const [
              TextSpan(
                  text: 'Welcome to fashion plaza',
                  style: TextStyle(fontSize: 15))
            ]),
          ),
          elevation: 0.3,
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                width: width * 0.32,
                height: height * 0.8,
                decoration: ShapeDecoration(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: TextFormField(
                  onFieldSubmitted: navigateToScreen,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
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
                ))
          ],
        ),
      ),

      // leading: Row(
      //   children: [
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     Text('Hi,${user.Name}', style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
      //   ],
      // ),
      // actions: [
      //   Switch.adaptive(
      //       value: context.watch<AuthProvider>().theme == ThemeData.light(),
      //       onChanged: (val) {
      //         context.read<AuthProvider>().changeTheme();
      //       })
      // ],

      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductList(),
            const SizedBox(
              height: 5,
            ),
            const Banners(),
            NewRow(
              width: width,
              text: 'New Arrival',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SeeAll()));
              },
            ),
            ProductContainer(),
            NewRow(
              width: width,
              text: 'Top Dresses',
              onTap: () {},
            ),
            
          ],
        ),
      ),
    );
  }
}
