import 'package:freezed_annotation/freezed_annotation.dart';

part 'results_dto.freezed.dart';
part 'results_dto.g.dart';

@Freezed()
class ResultsDto with _$ResultsDto {
  const factory ResultsDto({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'poster_path') String? posterPath,
    double? popularity,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _ResultsDto;

  factory ResultsDto.fromJson(Map<String, dynamic> json) => _$ResultsDtoFromJson(json);
}
