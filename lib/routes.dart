import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/profile_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginPage(),
  '/home': (context) => HomePage(),
  '/about': (context) => AboutPage(),
  '/profile': (context) => ProfilePage(),
};
