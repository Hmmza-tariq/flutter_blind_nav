import 'dart:async';

// import 'package:blind_nav/data/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  static String name = '';
  static String email = '';
  int currentIndex = 0;

  Timer? _timer;

  @override
  void onInit() {
    setUser();
    // _timer = Timer.periodic(const Duration(minutes: 1),
    //     (Timer t) => DataBaseManager.addLocationHistory());
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    update();
  }

  void setUser() {
    User user = FirebaseAuth.instance.currentUser!;
    name = user.email!.split('@')[0];
    email = user.email!;
    debugPrint('name $name email $email');
    update();
  }
}
