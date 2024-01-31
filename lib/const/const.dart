import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  String uri = "http://192.168.0.200:3000";
class ConstImage {

  static const image_path = 'asset/image';
  static const splash_screen01 = '$image_path/Splash Screen 01.png';
  static const splash_screen02 = '$image_path/Frame 2.png';
  static const frame3 = '$image_path/Frame 3.png';
  static const frame4 = '$image_path/Frame 4.png';
  static const frame5 = '$image_path/Frame 5.png';

  static const List<Map<String, String>> categoryList = [
    {'title': '50'},
    {'title': '70'}
  ];

  static const List<Map<String, dynamic>> productList = [
    {
      'title':'New Arrival',
      'icon': FontAwesomeIcons.planeArrival
    },
    {
      'title':'Clothes',
      'icon': FontAwesomeIcons.shirt
    },
    {
      'title':'Bags',
      'icon': FontAwesomeIcons.bagShopping
    },
    {
      'title':'Shoes',
      'icon': FontAwesomeIcons.shoePrints
    },
     {
      'title':'Electronics',
      'icon': FontAwesomeIcons.radio
    },
     {
      'title':'Jewelry',
      'icon': FontAwesomeIcons.ring
    }
  ];
}
