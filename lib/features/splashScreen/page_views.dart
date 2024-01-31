import 'package:ecommerce/features/splashScreen/pageView/page_view_1.dart';
import 'package:ecommerce/features/splashScreen/pageView/page_view_2.dart';
import 'package:ecommerce/features/splashScreen/pageView/page_view_3.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: const <Widget>[
          PageView1(),
          Pageview2(),
          PageView3()
      ],
    );
  }
}
