import 'package:delivery_hero_flutter_study_case/presentation/search/search_view_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/splash/splash_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> viewModelModule() async {
  searchViewModel = Provider.autoDispose((ref) => SearchViewModel(ref));
  splashViewModel = Provider.autoDispose((ref) => SplashViewModel(ref));
}

late final AutoDisposeProvider<SearchViewModel> searchViewModel;
late final AutoDisposeProvider<SplashViewModel> splashViewModel;
