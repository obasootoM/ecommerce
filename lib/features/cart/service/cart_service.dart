import 'dart:convert';
import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/const/error_handling.dart';
import 'package:ecommerce/const/utilis.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartService {
  void deleteCart(
      {required BuildContext context, required Product product}) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    try {
      http.Response res =
          await http.delete(Uri.parse('$uri/api/cart-delete/${product.id}'),
              headers: <String, String>{
                'content-type': 'application/json; charset=UTF-8',
                'x-auth-token': provider.user.Token
              },
              body: jsonEncode({'id': product.id}));
      HttpResponseService(
          response: res,
          context: context,
          success: () {
            User user =
                provider.user.copyWith(cart: jsonDecode(res.body)['cart']);
            provider.setUserFromModel(user);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
