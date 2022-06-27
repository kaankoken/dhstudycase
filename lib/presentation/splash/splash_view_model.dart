import 'package:delivery_hero_flutter_study_case/infra/core/base/base_view_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/extensions/dark_mode.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/routes/app_routes.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashViewModel extends BaseViewModel {
  bool isDarkMode = WidgetsBinding.instance.isDarkMode;

  SplashViewModel(super.ref) {
    _init();
  }

  void _init() async {
    // Fake app loading action
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        FlutterNativeSplash.remove();
      },
    );

    Future.delayed(
      const Duration(seconds: 4),
      () => routeManager.goNamed(
        AppRoutes.SEARCH,
      ),
    );
  }
}
