import 'package:blind_nav/config/assets_manager.dart';
import 'package:blind_nav/config/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NoData extends StatelessWidget {
  final String? text;
  const NoData({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        80.verticalSpace,
        Image.asset(AssetsManager.noData),
        20.verticalSpace,
        Text(text ?? Provider.of<StringsManager>(context).noData,
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium),
      ],
    );
  }
}
