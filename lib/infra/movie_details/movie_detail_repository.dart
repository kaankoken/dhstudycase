import 'package:delivery_hero_flutter_study_case/domain/movie_detail/i_movie_detail_repository.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/api/i_api_service.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/api/network_manager.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/service_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/movie_details_dto.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailRepository implements IMovieDetailRepository {
  @override
  bool isTest = false;

  late final IApiService _apiService;

  MovieDetailRepository(Ref ref) : _apiService = ref.read(apiService);

  @override
  Future<Either<String, MovieDetailsDto>> getMovieDetail(int movieId) async {
    try {
      final query = NetworkManager.baseQueryString;

      final result = await _apiService.getMovieDetails(movieId, query);

      return Either.right(result);
    } catch (e) {
      return const Either.left('');
      // Report to firebase etc.s
    }
  }
}
