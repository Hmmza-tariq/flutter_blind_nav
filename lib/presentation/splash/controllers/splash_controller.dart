import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offNamed(Routes.BASE);
      } else {
        Get.offNamed(Routes.AUTH);
      }
    });

    super.onInit();
  }
}
