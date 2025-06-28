import 'dart:io';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../profile/data/user_model.dart';
import 'package:flutter/widgets.dart'; 

class ProfileController extends GetxController {
  final String uid;

  ProfileController(this.uid);

  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
  try {
    // print('📌 UID: $uid'); 

    final doc = await _firestore.collection('users').doc(uid).get();

    if (doc.exists) {
      // print('✅ Document Data: ${doc.data()}');
      userModel.value = UserModel.fromMap(doc.data()!);
    } else {
      // print('❌ No document found for this UID');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Error', 'User not found');
      });
    }
  } catch (e) {
    // print('💥 Exception: $e');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar('Error', 'Failed to load profile');
    });
  }
}

  Future<void> uploadImageAndUpdate() async {
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked == null) return;

      isLoading.value = true;
      final file = File(picked.path);
      final fileName = basename(picked.path);

      final ref = _storage.ref().child('profile_images/$uid/$fileName');
      await ref.putFile(file);
      final imageUrl = await ref.getDownloadURL();

      await _firestore.collection('users').doc(uid).update({
        'imageUrl': imageUrl,
      });

      userModel.value = userModel.value?.copyWith(imageUrl: imageUrl);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Success', 'Profile picture updated');
      });
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Error', 'Failed to upload image');
      });
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String birthDate,
    required String gender,
  }) async {
    try {
      isLoading.value = true;

      final updated = userModel.value!.copyWith(
        name: name,
        phone: phone,
        birthDate: birthDate,
        gender: gender,
      );

      await _firestore.collection('users').doc(uid).update(updated.toMap());
      userModel.value = updated;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Success', 'Profile updated');
      });
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Error', 'Failed to update profile');
      });
    } finally {
      isLoading.value = false;
    }
  }
}
