import 'package:delivery_hero_flutter_study_case/infra/core/modules/repository_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/service_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/use_case_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/util_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/view_model_modules.dart';

Future<void> setupInjector() async {
  await Future.wait(
    [
      viewModelModule(),
      utilModule(),
      serviceModule(),
      repositoryModule(),
      useCaseModule(),
    ],
    eagerError: true,
  );
}
