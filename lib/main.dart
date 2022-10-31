import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/bindings/product_binding.dart';
import 'controller/bindings/summary_binding.dart';
import 'views/product_screen.dart';
import 'views/summary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plendron Task',
      theme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/product',
          page: () => ProductScreen(),
          binding: ProductBinding(),
        ),
        GetPage(
          name: '/summary',
          page: () => SummaryScreen(),
          binding: SummaryBinding(),
        ),
      ],
      initialRoute: '/product',
    );
  }
}
