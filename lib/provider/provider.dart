import 'package:ecommerce/model/user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.dark();
  User _user = User(
      Id: '',
      Name: '',
      Email: '',
      Password: '',
      Address: '',
      Token: '',
      Type: '',
      cart: []);

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  ThemeData get theme => _theme;
  void changeTheme() {
    final IsDark = _theme == ThemeData.dark();
    if (IsDark) {
      _theme = ThemeData.light();
    } else {
      _theme = ThemeData.dark();
    }
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}

enum Themes { dark, light }
