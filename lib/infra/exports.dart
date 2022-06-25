import 'package:delivery_hero_flutter_study_case/infra/core/localization/app_strings.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

late AppStrings appStrings;
late GoRouter route;
final RouteManager routeManager = RouteManager.instance;
final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
