import 'package:delivery_hero_flutter_study_case/application/movie_detail/interfaces/i_movie_detail_use_case.dart';
import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/models/movie_detail_model.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/movie_detail_state.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/base/base_view_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/use_case_modules.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';

class MovieDetailViewModel extends BaseViewModel {
  MovieDetailViewModel(super.ref);

  Future<void> getMovieDetail(int id) async {
    final IMovieDetailUseCase useCase = ref.read(movieDetailUseCase);

    final UIState<NoParams, MovieDetailModel> result = await useCase.invoke(id);

    ref.read(movieState.notifier).update((_) => result);
  }
}
