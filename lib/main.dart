import 'package:flutter/material.dart';
import 'theme.dart';
import 'routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Kita cek apakah sudah login, agar bisa langsung buka home jika sudah login
  final prefs = await SharedPreferences.getInstance();
  final savedUser = prefs.getString('username');

  runApp(MyApp(initialRoute: savedUser == null ? '/' : '/home'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H1D023114_Tugas7',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
