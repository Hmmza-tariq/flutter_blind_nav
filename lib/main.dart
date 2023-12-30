import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/data/my_shared_pref.dart';
import 'package:blind_nav/firebase_options.dart';
import 'package:blind_nav/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'config/theme/my_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MySharedPref.init();
  await Locations().getLocations();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<StringsManager>(
          create: (_) => StringsManager(MySharedPref.getIsUrdu(),
              location: MySharedPref.getMyLocation()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          return GetMaterialApp(
            title: Provider.of<StringsManager>(context).appName,
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              // kl
              return Theme(
                data: MyTheme.getThemeData(),
                child: MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: widget!,
                ),
              );
            },
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        },
      ),
    ),
  );
}
