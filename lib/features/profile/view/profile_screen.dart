import 'package:flutter/material.dart';
import 'package:flutter_profile_task/core/widgets/icon_text_button.dart';
import 'package:flutter_profile_task/features/profile/view_model/profile_controller.dart';
import 'package:flutter_profile_task/features/profile/widgets/menu_item.dart';
import 'package:get/get.dart';
import 'package:flutter_profile_task/core/constants/app_colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.salmon),
          onPressed: () => Get.back(),
        ),
        title: const Text('My Profile', style: TextStyle(color: AppColors.salmon)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.salmon),
            onPressed: () {Get.toNamed('/edit');},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = controller.userModel.value;
        if (user == null) {
          return const Center(child: Text('No user data available'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.beige,
                backgroundImage: user.imageUrl.isNotEmpty
                    ? NetworkImage(user.imageUrl)
                    : const AssetImage('assets/images/default_avatar.png')
                        as ImageProvider,
              ),
              const SizedBox(height: 12),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                'ID: ${user.id}',
                style: const TextStyle(fontSize: 16, color: AppColors.brownRosy),
              ),
              const SizedBox(height: 20),
              Container(
                height: 80, // Increased height
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.salmon,
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconTextButton(
                      icon: Icons.person,
                      text: 'Profile',
                      onPressed: () => Get.toNamed('/edit'),
                    ),
                    const VerticalDivider(
                      color: AppColors.white,
                      width: 1,
                      thickness: 1,
                    ),
                    IconTextButton(
                      icon: Icons.favorite, // Placeholder for wishlist icon
                      text: 'Wishlist',
                      onPressed: () {},
                    ),
                    const VerticalDivider(
                      color: AppColors.white,
                      width: 1,
                      thickness: 1,
                    ),
                    IconTextButton(
                      icon: Icons.local_offer, // Placeholder for orders icon
                      text: 'My Orders',
                      onPressed: () => Get.toNamed('/orders'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.payment,
                title: 'Payment Methods',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.notifications,
                title: 'Notification',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.help,
                title: 'Help',
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        );
      }),
    );
  }
}