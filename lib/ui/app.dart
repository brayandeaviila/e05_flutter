import 'package:flutter/material.dart';
import 'package:e05_flutter/theme.dart';
import 'package:e05_flutter/ui/products/product_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: appTheme,
      home: const ProductView(),
    );
  }
}