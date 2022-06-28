import 'package:delivery_hero_flutter_study_case/application/movie_detail/interfaces/i_movie_detail_use_case.dart';
import 'package:delivery_hero_flutter_study_case/application/movie_detail/movie_detail_use_case.dart';
import 'package:delivery_hero_flutter_study_case/application/search/interfaces/i_search_use_case.dart';
import 'package:delivery_hero_flutter_study_case/application/search/search_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> useCaseModule() async {
  movieDetailUseCase = Provider((ref) => MovieDetailUseCase(ref));
  searchUseCase = Provider((ref) => SearchUseCase(ref));
}

late final Provider<IMovieDetailUseCase> movieDetailUseCase;
late final Provider<ISearchUseCase> searchUseCase;
