import 'package:delivery_hero_flutter_study_case/infra/core/api/i_api_service.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/api/network_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> serviceModule() async {
  apiService = Provider((_) => IApiService(NetworkManager.getDio()));
}

late final Provider<IApiService> apiService;
