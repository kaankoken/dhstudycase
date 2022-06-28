import 'package:delivery_hero_flutter_study_case/application/movie_detail/interfaces/i_movie_detail_use_case.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/i_movie_detail_repository.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/models/dto_to_model.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/models/movie_detail_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/repository_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/toast.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailUseCase implements IMovieDetailUseCase {
  late final IMovieDetailRepository _repository;

  MovieDetailUseCase(Ref ref) : _repository = ref.read(movieDetailRepository);
  @override
  Future<UIState<NoParams, MovieDetailModel>> invoke(int param) async {
    final result = await _repository.getMovieDetail(param);

    return result.when(
      left: (left) {
        ToastMessage.toast(left);

        return const UIState.error(NoParams());
      },
      right: (right) => UIState.success(right.model),
    );
  }
}
