import 'package:delivery_hero_flutter_study_case/infra/core/utils/either.dart';
import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/movie_details_dto.dart';

abstract class IMovieDetailRepository {
  bool isTest = false;
  Future<Either<String, MovieDetailsDto>> getMovieDetail(int movieId);
}
