import 'package:currency_convert/pages/currency_convert_material_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Types of Widgets
// 1. Stateful Widgets - State is mutable i.e. can be altered
// 2. Stateless Widgets - State is immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencyConvertMaterialPage(),
    );
  }
}