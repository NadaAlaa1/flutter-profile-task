import 'package:flutter_profile_task/features/profile/bindings/profile_bindings.dart';
import 'package:flutter_profile_task/features/profile/view/root_screen.dart';
import 'package:flutter_profile_task/features/profile/view_model/my_orders_controllers.dart';
import 'package:get/get.dart';
import '../features/profile/view/profile_screen.dart';
import '../features/profile/view/edit_profile_screen.dart';
import '../features/profile/view/my_orders_screen.dart';

class AppRoutes {
  static const root = '/root';
  static const profile = '/profile';
  static const editProfile = '/edit';
  static const orders = '/orders';
}

class AppPages {
  static const initial = AppRoutes.root;

  static final routes = [
    GetPage(
      name: AppRoutes.root,
      page: () => const RootScreen(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const MyOrdersScreen(),
      binding: BindingsBuilder(() {
        Get.put(MyOrdersController());
      }),
    ),
  ];
}