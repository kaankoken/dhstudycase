import 'package:delivery_hero_flutter_study_case/domain/movie_detail/models/movie_detail_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/movie_details_dto.dart';

extension DtoToModel on MovieDetailsDto {
  MovieDetailModel get model {
    return MovieDetailModel(
      backdropImage: backdropPath,
      id: id,
      genres: genres,
      overview: overview,
    );
  }
}
