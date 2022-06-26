import 'package:delivery_hero_flutter_study_case/infra/search/dto/results_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_dto.freezed.dart';
part 'search_dto.g.dart';

@Freezed()
class SearchDto with _$SearchDto {
  const factory SearchDto({
    int? page,
    ResultsDto? results,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'total_pages') int? totalPages,
  }) = _SearchDto;

  factory SearchDto.fromJson(Map<String, dynamic> json) => _$SearchDtoFromJson(json);
}
