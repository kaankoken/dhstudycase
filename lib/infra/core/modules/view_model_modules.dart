import 'package:delivery_hero_flutter_study_case/presentation/splash/splash_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> viewModelModule() async {
  splashViewModel = Provider.autoDispose((ref) => SplashViewModel(ref));
}

late final AutoDisposeProvider<SplashViewModel> splashViewModel;
