import 'package:delivery_hero_flutter_study_case/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/search/search_view_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/splash/splash_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> viewModelModule() async {
  movieDetailViewModel = Provider.autoDispose((ref) => MovieDetailViewModel(ref));

  searchViewModel = Provider.autoDispose((ref) => SearchViewModel(ref));
  splashViewModel = Provider.autoDispose((ref) => SplashViewModel(ref));
}

late final AutoDisposeProvider<MovieDetailViewModel> movieDetailViewModel;
late final AutoDisposeProvider<SearchViewModel> searchViewModel;
late final AutoDisposeProvider<SplashViewModel> splashViewModel;
