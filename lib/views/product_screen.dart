import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/controller/product_controller.dart';
import 'package:interview/widgets/row_product.dart';

class ProductScreen extends StatelessWidget {
  late ProductController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<ProductController>();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              const SizedBox(width: 10,),
              const Icon(Icons.shopping_cart_checkout_sharp),
              const SizedBox(width: 10,),
              Obx(() =>  Text(
                '${controller.cart.length} items',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 150.0, right: 50.0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    Get.toNamed('/summary');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Text("Place Order"),
                ),
              ))
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Salad & Soups"),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(10.0),
                separatorBuilder: (_, __) => const Divider(color: Colors.white),
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return RowProduct(
                    foodItem: controller.list[index],
                    controller: controller,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
