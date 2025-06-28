import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Get.offNamed('/profile', parameters: {'uid': 'uar0med65Byv1z2rlfPd'});
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
