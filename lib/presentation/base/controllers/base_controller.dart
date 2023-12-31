// import 'package:blind_nav/data/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  static String name = '';
  static String email = '';
  static String caneId = '';
  bool idAdded = false;
  int currentIndex = 0;

  @override
  void onInit() {
    setUser();
    super.onInit();
  }

  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    update();
  }

  void toggleIdAdded() {
    idAdded = !idAdded;
    update();
  }

  void setUser() {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      name = user.email!.split('@')[0];
      email = user.email!;
    } catch (e) {
      debugPrint('setUser error $e, $name, $email');
    }
    debugPrint('name $name email $email');
    update();
  }
}
