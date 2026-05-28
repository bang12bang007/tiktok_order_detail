import 'package:flutter/material.dart';
import 'package:tiktok/screens/order_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Promotion Detail',
      debugShowCheckedModeBanner: false, // Clean look without banner
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFE2C55), // Brand primary
        ),
        // Configure standard sans-serif system fonts
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      ),
      home: const OrderDetail(),
    );
  }
}
