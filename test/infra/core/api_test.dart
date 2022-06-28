import 'package:delivery_hero_flutter_study_case/infra/core/api/network_manager.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/service_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/util_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  late ProviderContainer container;

  WidgetsFlutterBinding.ensureInitialized();

  setUpAll(
    () async {
      dotEnv.testLoad(
        mergeWith: {
          'MODE': 'DEV',
          'BASE_URL': 'https://api.themoviedb.org/3/',
          'API_KEY': '35ef0461fc4557cf1d256d3335ed7545',
        },
      );

      await Future.wait(
        [
          serviceModule(),
          utilModule(),
        ],
      );
      container = ProviderContainer();
    },
  );

  group(
    'Search Api Test',
    () {
      test(
        'Search Empty Result Test',
        () async {
          final service = container.read(apiService);

          final query = NetworkManager.baseQueryString;
          query.putIfAbsent('include_adult', () => 'false');
          query.putIfAbsent('page', () => 1);
          query.putIfAbsent('query', () => '');

          expect(() async => await service.search(query), throwsException);
        },
      );

      test(
        'Search with Text Test',
        () async {
          final service = container.read(apiService);

          final query = NetworkManager.baseQueryString;
          query.putIfAbsent('include_adult', () => 'false');
          query.putIfAbsent('page', () => 1);
          query.putIfAbsent('query', () => 'batman');

          try {
            await service.search(query);
          } catch (e) {
            rethrow;
          }
        },
      );
    },
  );

  group(
    'Movie Detail Api Test',
    () {
      test(
        'Movie Detail Error Test',
        () async {
          final service = container.read(apiService);

          final query = NetworkManager.baseQueryString;

          expect(() async => await service.getMovieDetails(-1231, query), throwsException);
        },
      );

      test(
        'Movie Detail Test',
        () async {
          final service = container.read(apiService);

          final query = NetworkManager.baseQueryString;

          try {
            await service.getMovieDetails(
              415,
              query,
            );
          } catch (e) {
            rethrow;
          }
        },
      );
    },
  );
}
