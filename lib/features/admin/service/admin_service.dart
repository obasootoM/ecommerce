import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecommerce/const/const.dart';
import 'package:ecommerce/const/error_handling.dart';
import 'package:ecommerce/const/utilis.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AdminService {
  
  void fetchProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double quantity,
    required List<File> images,
    required String category,
    required double price,
  }) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    try {
      // final cloud = CloudinaryPublic('denfgaxvg', 'uszbstnu');
      // List<String> image = [];
      // for (int i = 0; i < images.length; i++) {
      //   CloudinaryResponse res = await cloud
      //       .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
      //   image.add(res.secureUrl);
      // }
      final cloudinary =
          CloudinaryPublic('dlem80kmx', 'anrq6yzh', cache: false);
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          category: category,
          price: price,
          id: '',
          images: imageUrls);

      http.Response response =
          await http.post(Uri.parse('$uri/api/post-product'),
              headers: <String, String>{
                'content-type': 'application/json; charset=UTF-8',
                'x-auth-token': provider.user.Token
              },
              body: product.toJson());

      HttpResponseService(
          response: response,
          context: context,
          success: () {
            showSnackBar(context, 'product successfully added');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> getProduct(BuildContext context) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    List<Product> product = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/get-product'),
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

  void deleteProduct(
      {required Product product,
      required BuildContext context,
      required VoidCallback success}) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    try {
      http.Response res =
          await http.delete(Uri.parse('$uri/api/delete-product'),
              headers: <String, String>{
                'content-type': 'application/json; charset=UTF-8',
                'x-auth-token': provider.user.Token
              },
              body: jsonEncode({
                'id': product.id}));
      HttpResponseService(response: res, context: context, success: success);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
