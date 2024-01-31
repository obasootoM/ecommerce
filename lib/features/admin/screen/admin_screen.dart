import 'package:ecommerce/features/admin/screen/admin_home.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int selectIndex = 0;
  final List<Widget> selectItem = [
     const AdminHome(),
     const Center(child: Text('analytics')),
     const Center(child: Text('note')), 
  ];
  void selectPage(int item) {
    setState(() {
      selectIndex = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectItem[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.black,
          currentIndex: selectIndex,
          onTap: selectPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'analytics'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'Note'),
          ]),
    );
  }
}
