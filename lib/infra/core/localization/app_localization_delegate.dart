import 'package:delivery_hero_flutter_study_case/infra/core/localization/app_strings.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppStrings> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppStrings> load(Locale locale) {
    appStrings = AppStrings(locale);

    return SynchronousFuture<AppStrings>(appStrings);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppStrings> old) {
    return true;
  }
}
