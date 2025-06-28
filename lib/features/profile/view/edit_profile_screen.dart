// 📁 edit_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_profile_task/core/constants/app_colors.dart';
import 'package:flutter_profile_task/core/widgets/custom_button.dart';
import 'package:flutter_profile_task/core/widgets/custom_text_field.dart';
import 'package:flutter_profile_task/features/profile/view_model/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final user = controller.userModel.value!;

    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final phoneController = TextEditingController(text: user.phone);
    final birthDateController = TextEditingController(text: user.birthDate);
    final RxString gender = user.gender.obs;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.salmon),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: AppColors.salmon,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(height: 15),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: AppColors.beige,
                    backgroundImage:
                        user.imageUrl.isNotEmpty
                            ? NetworkImage(user.imageUrl)
                            : const AssetImage(
                                  'assets/images/default_avatar.png',
                                )
                                as ImageProvider,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.salmon,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: AppColors.white,
                        size: 23,
                      ),
                      onPressed: controller.uploadImageAndUpdate,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Name & ID
            Container(
              width: double.infinity,
              color: AppColors.beige,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "ID: ${user.id}",
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.brownRosy,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text Fields
                  const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.orangeDark,
                    ),
                  ),
                  const SizedBox(height: 1),
                  CustomTextField(
                    controller: nameController,
                    fillColor: AppColors.beige,
                    borderRadius: 12.0,
                  ),
                  const SizedBox(height: 6),

                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.orangeDark,
                    ),
                  ),
                  const SizedBox(height: 1),
                  CustomTextField(
                    controller: emailController,
                    fillColor: AppColors.beige,
                    borderRadius: 12.0,
                  ),
                  const SizedBox(height: 6),

                  const Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.orangeDark,
                    ),
                  ),
                  const SizedBox(height: 1),
                  CustomTextField(
                    controller: phoneController,
                    fillColor: AppColors.beige,
                    borderRadius: 12.0,
                  ),
                  const SizedBox(height: 6),

                  const Text(
                    'Date Of Birth',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.orangeDark,
                    ),
                  ),
                  const SizedBox(height: 1),
                GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: AppColors.salmon,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  birthDateController.text =
                      "${pickedDate.day.toString().padLeft(2, '0')} / ${pickedDate.month.toString().padLeft(2, '0')} / ${pickedDate.year}";
                }
              },
              child: AbsorbPointer(
                child: CustomTextField(
                  controller: birthDateController,
                  fillColor: AppColors.beige,
                  borderRadius: 12.0,
                ),
              ),
            ),

                  const SizedBox(height: 6),
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.orangeDark,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Obx(
                    () => Row(
                      children: [
                        Expanded(child: genderOption('Male', 'male', gender)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: genderOption('Female', 'female', gender),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),
                  CustomButton(
                    text: 'Update Profile',
                    onPressed: () async {
                      await controller.updateProfile(
                        name: nameController.text,
                        phone: phoneController.text,
                        birthDate: birthDateController.text,
                        gender: gender.value,
                      );
                    },
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget genderOption(String label, String value, RxString group) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio<String>(
            value: value,
            groupValue: group.value,
            onChanged: (val) => group.value = val!,
            activeColor: AppColors.salmon,
          ),
          Text(label, style: const TextStyle(color: AppColors.black)),
        ],
      ),
    );
  }
}
