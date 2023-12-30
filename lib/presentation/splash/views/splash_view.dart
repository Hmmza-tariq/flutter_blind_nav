import 'package:blind_nav/config/assets_manager.dart';
import 'package:blind_nav/config/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    var theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsManager.logo,
                width: 200.w,
                height: 200.h,
              ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 500),
                  begin: 1,
                  curve: Curves.easeInSine),
              20.verticalSpace,
              Text(
                Provider.of<StringsManager>(context).appName,
                style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.primaryColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 500),
                  begin: 5,
                  curve: Curves.easeInSine),
            ],
          ),
        ),
      ),
    );
  }
}
