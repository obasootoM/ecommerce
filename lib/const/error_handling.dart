import 'dart:convert';

import 'package:ecommerce/const/utilis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void HttpResponseService({
  required http.Response response,
  required BuildContext context,
  required VoidCallback success,
}) {
  switch (response.statusCode) {
    case 200:
      success();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, jsonDecode(response.body));
  }
}
