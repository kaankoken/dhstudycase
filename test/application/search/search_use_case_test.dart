import 'package:delivery_hero_flutter_study_case/application/search/interfaces/i_search_use_case.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/repository_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/service_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/use_case_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/util_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
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
          useCaseModule(),
        ],
      );
      container = ProviderContainer();
      container.read(searchRepository).isTest = true;
    },
  );

  group(
    'Search Use Case Test',
    () {
      test(
        'Search Empty Result Test',
        () async {
          final useCase = container.read(searchUseCase);

          final data = await useCase.invoke(
            const SearchArguments(
              searchText: '',
              pageNumber: 1,
            ),
          );

          final result = data is Error;
          expect(result, true);
        },
      );

      test(
        'Search with Text Test',
        () async {
          final useCase = container.read(searchUseCase);

          final data = await useCase.invoke(
            const SearchArguments(
              searchText: 'batman',
              pageNumber: 1,
            ),
          );

          final result = data is Success;
          expect(result, true);
        },
      );
    },
  );
}
