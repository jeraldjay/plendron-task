import 'package:get/get.dart';
import 'package:interview/models/fooditems.dart';

class ProductController extends GetxController {
  RxList<FoodItems> cart = <FoodItems>[].obs;
  RxInt grandTotal = 0.obs;
  RxList<FoodItems> list = <FoodItems>[
    FoodItems(
        id: 1,
        name: "The Mixed Green Salad",
        price: 120,
        image: "https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad.jpg",
        qty: 0),
    FoodItems(
        id: 2,
        name: "Wagyu Kobe Short Rib",
        price: 100,
        image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/7/9/DVSP92_Korean-Style-Beef-Short-Ribs_s4x3.jpg.rend.hgtvcom.616.462.suffix/1562688692953.jpeg",
        qty: 0),
    FoodItems(
        id: 3,
        name: "Cucumber Salad",
        price: 300,
        image: "https://image.shutterstock.com/image-photo/cucumber-salad-chinese-style-cucumbers-260nw-1181926822.jpg",
        qty: 0),
    FoodItems(
        id: 4,
        name: "Fruit Salad",
        price: 230,
        image: "https://media.istockphoto.com/photos/heallthy-organic-fruit-salad-picture-id511622035?k=20&m=511622035&s=612x612&w=0&h=orK-ebrO0n1zb-U4UwOVlJ2i0vK0zso7ueK3jr08U9U=",
        qty: 0),
    FoodItems(
        id: 5,
        name: "Veg Salad",
        price: 541,
        qty: 0,
        image: "https://thumbs.dreamstime.com/b/heart-shape-various-vegetables-fruits-healthy-food-concept-isolated-white-background-140287808.jpg"),
    ].obs;


  void addItemToCart(FoodItems foooditem) {
    foooditem.qty = 1;
    cart.add(foooditem);
    calculateGrandTotal();
  }

  void decreaseQtyOfItemInCart(FoodItems foooditem) {
    if (foooditem.qty == 1) {
      cart.removeWhere((FoodItems selectedItem) => selectedItem.id == foooditem.id);
    } else {
      cart.removeWhere((FoodItems selectedItem) => selectedItem.id == foooditem.id);
      foooditem.qty--;
      cart.add(foooditem);
    }
    calculateGrandTotal();
  }

  void increaseQtyOfItemInCart(FoodItems foooditem) {
    cart.removeWhere((FoodItems selectedItem) => selectedItem.id == foooditem.id);
    foooditem.qty++;
    cart.add(foooditem);
    calculateGrandTotal();
    print("|printing cart*******0");
  }

  void removeSelectedItemFromCart(int id) {
    cart.removeWhere((FoodItems selectedItem) => selectedItem.id == id);
  }


void calculateGrandTotal() {
  grandTotal.value = 0;
  for (int i = 0; i < cart.length; i++) {
    grandTotal = grandTotal + (cart[i].qty * cart[i].price);
  }
}
}
