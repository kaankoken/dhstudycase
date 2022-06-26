import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/genre_dto.dart';
import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/production_companies_dto.dart';
import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/production_countries_dto.dart';
import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/spoken_languages_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_dto.freezed.dart';
part 'movie_details_dto.g.dart';

@Freezed()
class MovieDetailsDto with _$MovieDetailsDto {
  const factory MovieDetailsDto({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'belongs_to_collection') Object? belongsToCollection,
    int? budget,
    @JsonKey(name: 'genres') List<GenreDto>? genres,
    String? homepage,
    int? id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies') List<ProductionCompaniesDto>? productionCompanies,
    @JsonKey(name: 'production_countries') List<ProductionCountriesDto>? productionCountries,
    @JsonKey(name: 'release_date') String? releaseDate,
    int? revenue,
    int? runtime,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguagesDto>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _MovieDetailsDto;

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) => _$MovieDetailsDtoFromJson(json);
}
