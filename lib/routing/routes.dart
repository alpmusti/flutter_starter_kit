import 'package:flutter/material.dart';
import '/app/login/login_page.dart';
import '/app/home/home_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> all() =>
      {LoginPage.name: (_) => LoginPage(), HomePage.name: (_) => HomePage()};
}
