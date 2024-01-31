import 'package:ecommerce/features/cart/screen/cart_screen.dart';
import 'package:ecommerce/features/homeScreen/screen/home_page.dart';
import 'package:ecommerce/features/profile/screen/profile_screen.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  List<Widget> selectItem = [
    const HomePage(),
    const CartScreen(),
    const Center(child: Text('notification')),
    const ProfileScreen()
  ];

  void selectPage(int item) {
    setState(() {
      selectIndex = item;
    });
  }

  @override
  Widget build(BuildContext context) {
   final userCartLenth = context.watch<AuthProvider>().user.cart.length;
    return Scaffold(
      body: selectItem[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.black,
          currentIndex: selectIndex,
          onTap: selectPage,
          items:  [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: badges.Badge(
              badgeContent: Text(userCartLenth.toString()),
              child: const Icon(Icons.shopping_cart_outlined),
            ), label: 'Cart'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'Note'),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
