import 'package:flutter/material.dart';
import 'package:payment_gateway/Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Gateway',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Payment Gateway'),
    );
  }
}
