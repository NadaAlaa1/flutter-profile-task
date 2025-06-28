import 'package:flutter/material.dart';
import 'package:flutter_profile_task/core/constants/app_colors.dart';
import 'package:flutter_profile_task/features/profile/data/order_model.dart';
import 'package:flutter_profile_task/features/profile/widgets/order_card.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderModel> orders = [
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
      // ممكن تضيفي أوردرات أكتر هنا
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.salmon),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          'My Orders',
          style: TextStyle(
            color: AppColors.terracotta,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index]);
        },
      ),
    );
  }
}
