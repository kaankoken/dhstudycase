import 'package:delivery_hero_flutter_study_case/infra/core/modules/view_model_modules.dart';

Future<void> setupInjector() async {
  await Future.wait(
    [
      viewModelModule(),
    ],
    eagerError: true,
  );
}
