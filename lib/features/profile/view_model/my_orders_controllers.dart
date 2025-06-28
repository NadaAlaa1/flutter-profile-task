import 'package:flutter_profile_task/features/profile/data/order_model.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController  {
  /// List of orders
  RxList<OrderModel> orders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  /// Initial sample data
  void loadOrders() {
    orders.value = [
      OrderModel(
        item: 'Serenity Nightstand',
        amount: 7.5,
        image: 'assets/images/nightstand.jpg',
        status: 'Delivered',
        date: 'May 15',
        quantity: 1,
      ),
      OrderModel(
        item: 'Blue Table Lamp',
        amount: 25,
        image: 'assets/images/lamp.jpg',
        status: 'Canceled',
        date: 'May 22',
        quantity: 2,
      ),
      OrderModel(
        item: 'Bedroom Dresser',
        amount: 285,
        image: 'assets/images/dresser.jpg',
        status: 'Delivered',
        date: 'June 04',
        quantity: 1,
      ),
      OrderModel(
        item: 'Modern Bed',
        amount: 285,
        image: 'assets/images/bed.jpg',
        status: 'Delivered',
        date: 'June 12',
        quantity: 2,
      ),
      OrderModel(
        item: 'Blue Table Lamp',
        amount: 25,
        image: 'assets/images/lamp.jpg',
        status: 'Canceled',
        date: 'May 22',
        quantity: 2,
      ),
      OrderModel(
        item: 'Serenity Nightstand',
        amount: 7.5,
        image: 'assets/images/nightstand.jpg',
        status: 'Delivered',
        date: 'May 15',
        quantity: 1,
      ),
    ];
  }

  /// Increase quantity
  void increaseQuantity(int index) {
    orders[index].quantity++;
    orders.refresh();
  }

  /// Decrease quantity
  void decreaseQuantity(int index) {
    if (orders[index].quantity > 1) {
      orders[index].quantity--;
      orders.refresh();
    }
  }
}
