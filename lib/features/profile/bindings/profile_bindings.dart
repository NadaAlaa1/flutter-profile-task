import 'package:get/get.dart';
import '../view_model/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    final uid = Get.parameters['uid'] ?? '';
    print('🔐 ProfileBinding received UID: $uid'); // للتأكد
    Get.put(ProfileController(uid));
  }
}




