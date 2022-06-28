import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/genre_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_model.freezed.dart';

@Freezed()
class MovieDetailModel with _$MovieDetailModel {
  const factory MovieDetailModel({
    int? id,
    String? overview,
    List<GenreDto>? genres,
    String? backdropImage,
  }) = _MovieDetailModel;
}
