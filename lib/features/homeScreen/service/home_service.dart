import 'dart:convert';

import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/const/error_handling.dart';
import 'package:ecommerce/const/utilis.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeService {
 
  Future<List<Product>> fetchProductCategory(
      {required BuildContext context, required String category}) async {
    final provider = Provider.of<AuthProvider>(context,listen: false);
    List<Product> product = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/product?category=$category'),
        headers: <String, String>{
          'content-type': 'application/json; charset=UTF-8',
          'x-auth-token': provider.user.Token
        },
      );
     HttpResponseService(
          response: res,
          context: context,
          success: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              product
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return product;
  }
}
