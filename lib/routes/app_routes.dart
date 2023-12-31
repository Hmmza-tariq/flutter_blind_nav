// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const AUTH = _Paths.AUTH;
  static const PHONE = _Paths.PHONE;
  static const BASE = _Paths.BASE;
  static const HOME = _Paths.HOME;
  static const HISTORY = _Paths.HISTORY;
  static const SETTINGS = _Paths.SETTINGS;
  static const CANE_ID = _Paths.CANE_ID;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const AUTH = '/auth';
  static const PHONE = '/phone';
  static const BASE = '/base';
  static const HOME = '/home';
  static const HISTORY = '/history';
  static const SETTINGS = '/settings';
  static const CANE_ID = '/cane-id';
}
