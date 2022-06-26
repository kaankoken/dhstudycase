import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_countries_dto.freezed.dart';
part 'production_countries_dto.g.dart';

@Freezed()
class ProductionCountriesDto with _$ProductionCountriesDto {
  const factory ProductionCountriesDto({
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    String? name,
  }) = _ProductionCountriesDto;

  factory ProductionCountriesDto.fromJson(Map<String, dynamic> json) => _$ProductionCountriesDtoFromJson(json);
}
