import 'package:blind_nav/presentation/auth/binding/auth_binding.dart';
import 'package:blind_nav/presentation/auth/view/auth_view.dart';
import 'package:blind_nav/presentation/base/bindings/base_binding.dart';
import 'package:blind_nav/presentation/base/views/base_view.dart';
import 'package:blind_nav/presentation/history/bindings/history_binding.dart';
import 'package:blind_nav/presentation/history/views/history_view.dart';
import 'package:blind_nav/presentation/home/bindings/home_binding.dart';
import 'package:blind_nav/presentation/home/views/home_view.dart';
import 'package:blind_nav/presentation/settings/bindings/settings_binding.dart';
import 'package:blind_nav/presentation/settings/views/settings_view.dart';
import 'package:blind_nav/presentation/splash/bindings/splash_binding.dart';
import 'package:blind_nav/presentation/splash/views/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
