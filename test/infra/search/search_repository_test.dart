import 'package:delivery_hero_flutter_study_case/infra/core/modules/repository_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/service_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/util_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/either.dart';
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
          repositoryModule(),
        ],
      );
      container = ProviderContainer();
      container.read(searchRepository).isTest = true;
    },
  );

  group(
    'Search Repository Test',
    () {
      test(
        'Search Empty Result Test',
        () async {
          final repository = container.read(searchRepository);

          final data = await repository.search('', pageNumber: 1);

          final result = data is Left;
          expect(result, true);
        },
      );

      test(
        'Search with Text Test',
        () async {
          final repository = container.read(searchRepository);

          final data = await repository.search('batman', pageNumber: 1);

          final result = data is Right;
          expect(result, true);
        },
      );
    },
  );
}
