import 'dart:io';

import 'package:delivery_hero_flutter_study_case/infra/core/localization/app_localization_delegate.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/routes/routes.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:delivery_hero_flutter_study_case/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  route = Routes.router;
  await setupInjector();

  runApp(const ProviderScope(child: DHStudyCase()));
}

class DHStudyCase extends ConsumerWidget {
  const DHStudyCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Platform.isAndroid
        ? MaterialApp.router(
            title: 'DH Study Case',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            routeInformationParser: route.routeInformationParser,
            routerDelegate: route.routerDelegate,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('tr', ''),
              Locale('en', ''),
            ],
          )
        : CupertinoApp.router(
            title: 'DH Study Case',
            theme: const CupertinoThemeData(
              primaryColor: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            routeInformationParser: route.routeInformationParser,
            routerDelegate: route.routerDelegate,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('tr', ''),
              Locale('en', ''),
            ],
          );
  }
}
