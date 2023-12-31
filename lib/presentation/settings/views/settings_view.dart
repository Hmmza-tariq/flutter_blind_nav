import 'package:blind_nav/config/assets_manager.dart';
import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/my_shared_pref.dart';
import 'package:blind_nav/presentation/auth/controller/auth_controller.dart';
import 'package:blind_nav/presentation/base/controllers/base_controller.dart';
import 'package:blind_nav/presentation/widgets/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            ScreenTitle(
              title: Provider.of<StringsManager>(context).settings,
              dividerEndIndent: 230,
            ),
            20.verticalSpace,
            Text(Provider.of<StringsManager>(context).account,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            GetBuilder<BaseController>(
                init: BaseController(),
                id: 'User',
                builder: (_) {
                  return SettingsItem(
                    title: BaseController.name,
                    icon: AssetsManager.userIcon,
                    isAccount: true,
                    description: 'Cane Id#${BaseController.caneId}',
                  );
                }),
            30.verticalSpace,
            Text(Provider.of<StringsManager>(context).settings,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            25.verticalSpace,
            SettingsItem(
              title:
                  '${Provider.of<StringsManager>(context).language} - ${Provider.of<StringsManager>(context).currentLanguage}',
              icon: AssetsManager.languageIcon,
              isLanguage: true,
              description: '',
            ),
            25.verticalSpace,
            // SettingsItem(
            //   title: Provider.of<StringsManager>(context).help,
            //   icon: AssetsManager.helpIcon,
            //   description: '',
            // ),
            // 25.verticalSpace,
            SettingsItem(
              title: Provider.of<StringsManager>(context).logout,
              icon: AssetsManager.logoutIcon,
              description: '',
              onTap: () => AuthController().logout(),
            ),
            25.verticalSpace,
            SettingsItem(
              title: Provider.of<StringsManager>(context).clear,
              icon: AssetsManager.clear,
              description: '',
              onTap: () {
                MySharedPref.clear();
                AuthController().logout();
              },
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
