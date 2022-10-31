import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:interview/controller/product_controller.dart';
import 'package:interview/models/fooditems.dart';

class RowProduct extends StatelessWidget {
  FoodItems foodItem;
  ProductController controller;

  RowProduct({
    Key? key,
    required this.foodItem,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 110.0,
          height: 90.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                foodItem.image,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${foodItem.name}",
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10.0),
              Text(
                "\$ ${NumberFormat.currency(decimalDigits: 0, symbol: '').format(foodItem.price)}",
              ),
              Obx(() {
                FoodItems? selectedModel = controller.cart.firstWhereOrNull(
                    (FoodItems selectedItem) => selectedItem.id == foodItem.id);

                if (selectedModel == null) {
                  print('pro page if con ');
                  return ElevatedButton(
                    onPressed: () {
                      controller.addItemToCart(foodItem);
                    },
                    child: Text("ADD"),
                  );
                } else {
                  print('pro page else con');
                  return _buildQty(selectedModel);
                }
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQty(FoodItems selectedModel) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => controller.decreaseQtyOfItemInCart(foodItem),
              icon: Icon(Icons.remove),
            ),
            Text(selectedModel.qty.toString()),
            IconButton(
              onPressed: () => controller.increaseQtyOfItemInCart(foodItem),
              icon: Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
