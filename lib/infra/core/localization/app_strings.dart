import 'package:flutter/widgets.dart';

class AppStrings {
  final Locale locale;

  static AppStrings? _instance;
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'DH Study Case',
      'loading': 'Loading...',
      'youAreOffline': 'You are offline',
    },
    'tr': {
      'app_name': 'DH Study Case',
      'loading': 'Yükleniyor...',
      'youAreOffline': 'İnternet bağlantınız yok',
    },
  };

  AppStrings(this.locale);

  static AppStrings get instance => _instance ?? AppStrings(const Locale('en'));

  String get appName => _getString('app_name');
  String get loading => _getString('loading');
  String get youAreOffline => _getString('youAreOffline');

  String getByKey(String key) => _getString(key);
  String _getString(String key) =>
      _localizedValues[locale.languageCode]?.entries.singleWhere((entry) => entry.key == key).value ?? '';
}
