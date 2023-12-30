import 'package:blind_nav/config/assets_manager.dart';
import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/presentation/auth/controller/auth_controller.dart';
import 'package:blind_nav/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      id: 'AuthType',
      builder: (_) {
        return FlutterLogin(
          title: Provider.of<StringsManager>(context).appName,
          logo: const AssetImage(AssetsManager.logo),
          onLogin: controller.authUser,
          onSignup: controller.signupUser,
          userType: LoginUserType.email,
          loginProviders: <LoginProvider>[
            LoginProvider(
              icon: FontAwesomeIcons.google,
              callback: controller.signupGoogle,
            ),
          ],
          onSubmitAnimationCompleted: () {
            FocusScope.of(context).unfocus();
            Get.offNamed(Routes.BASE);
          },
          onRecoverPassword: controller.recoverPassword,
        );
      },
    );
  }
}
