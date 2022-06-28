import 'package:delivery_hero_flutter_study_case/application/i_use_case.dart';
import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/models/movie_detail_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';

abstract class IMovieDetailUseCase extends IUseCase<UIState<NoParams, MovieDetailModel>, int> {}
