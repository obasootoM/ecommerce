import 'dart:convert';

import 'package:ecommerce/const/error_handling.dart';
import 'package:ecommerce/const/utilis.dart';
import 'package:ecommerce/features/admin/screen/admin_screen.dart';
import 'package:ecommerce/features/homeScreen/screen/navigation.dart';
import 'package:ecommerce/model/user.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//101.188.67.134
//105.112.230.187
//192.168.43.255
//192.168.0.255
//192.168.43.178
class Service {
  String uri = "http://192.168.0.200:3000";
  void signup(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      User user = User(
          Id: '',
          Name: name,
          Email: email,
          Password: password,
          Address: '',
          Token: '',
          Type: '',
          cart: []
          );

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8'
          });
      HttpResponseService(
          response: res,
          context: context,
          success: () {
            showSnackBar(context, 'Account created, you can now login');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signin(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/signIn"),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode({"email": email, "password": password}));
      HttpResponseService(
          response: res,
          context: context,
          success: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<AuthProvider>(context, listen: false).setUser(res.body);
            await pref.setString("x-auth-token", jsonDecode(res.body)["token"]);
            if (Provider.of<AuthProvider>(context, listen: false).user.Type ==
                'user') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminScreen()));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  getUserData({required BuildContext context}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');
      if (token == null) {
        pref.setString('x-auth-token', '');
      }
      var res = await http.post(Uri.parse('$uri/tokenIsVerified'),
          headers: <String, String>{
            'content-type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(res.body);
      if (response == true) {
        http.Response userResponse = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'content-type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<AuthProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
