import 'package:flutter/material.dart';
import 'package:tiktok/theme/app_font.dart';
import 'package:tiktok/screens/order_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Promotion Detail',
      debugShowCheckedModeBanner: false, // Clean look without banner
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFE2C55), // Brand primary
          brightness: Brightness.light,
        ),
        fontFamily: AppFont.sans,
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        cardColor: Colors.white,
        dividerColor: const Color(0xFFF1F1F3),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFE2C55), // Brand primary
          brightness: Brightness.dark,
        ),
        fontFamily: AppFont.sans,
        scaffoldBackgroundColor: const Color(0xFF121212), // Authentic TikTok dark bg
        cardColor: const Color(0xFF1D1F24), // Authentic TikTok dark card bg
        dividerColor: const Color(0xFF2C2C2E),
      ),
      themeMode: _themeMode,
      home: const OrderDetail(),
    );
  }
}
