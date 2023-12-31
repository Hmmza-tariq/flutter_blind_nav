import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/settings_controller.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final bool isAccount;
  final bool isDark;
  final bool isLanguage;
  final void Function()? onTap;
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.isAccount = false,
    this.isDark = false,
    this.isLanguage = false,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return ListTile(
      onTap: onTap,
      title: Text(title,
          style: theme.textTheme.displayMedium?.copyWith(
            fontSize: 16.sp,
          )),
      subtitle: !isAccount
          ? null
          : Text(
              description,
              style: theme.textTheme.displaySmall,
            ),
      leading: CircleAvatar(
        radius: isAccount ? 30.r : 25.r,
        backgroundColor: theme.primaryColor,
        child: SvgPicture.asset(icon, fit: BoxFit.none),
      ),
      trailing: isLanguage
          ?
          // ElevatedButton(
          //     onPressed:
          //         Provider.of<StringsManager>(context).toggleLanguage(),
          //     child: const Text('Change Language'))
          GetBuilder<SettingsController>(
              id: 'Language',
              builder: (controller) => CupertinoSwitch(
                value: !controller.isUrdu,
                onChanged: controller.changeLanguage,
                activeColor: theme.primaryColor,
              ),
            )
          : SizedBox(
              width: 40.w,
              height: 40.h,
              // decoration: BoxDecoration(
              //   color: theme.primaryColor,
              //   borderRadius: BorderRadius.circular(10.r),
              // ),
              // child: SvgPicture.asset(AssetsManager.forwardArrowIcon,
              //     fit: BoxFit.none),
            ),
    );
  }
}
