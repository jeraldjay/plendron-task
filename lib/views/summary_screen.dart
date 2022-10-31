

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../models/fooditems.dart';


class SummaryScreen extends StatelessWidget {
  late ProductController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<ProductController>();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(

        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0, right: 50.0),
                child:  Obx(() =>   Text(
                  '\$ ${controller.grandTotal.value.toString()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),),
              )
            ],
          ),
        ),
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.cart.length,
          itemBuilder: (context,index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text(controller.cart[index].name)),
                      Obx(() {
                        FoodItems? selectedModel = controller.cart.firstWhereOrNull(
                                (FoodItems selectedItem) => selectedItem.id == controller.cart[index].id);

                        if (selectedModel == null) {
                          print('if con');
                          return ElevatedButton(
                            onPressed: () {
                              controller.addItemToCart(controller.cart[index]);
                            },
                            child: const Text("ADD"),
                          );
                        } else {
                          print('else con');
                          return _buildQty(selectedModel);
                        }
                      }),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text("\$ ${controller.cart[index].price}"),
                )
              ],
            );
          })),
    );
  }
  Widget _buildQty(FoodItems selectedModel) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => controller.decreaseQtyOfItemInCart(selectedModel),
              icon: const Icon(Icons.remove),
            ),
            Text(selectedModel.qty.toString()),
            IconButton(
              onPressed: () => controller.increaseQtyOfItemInCart(selectedModel),
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
