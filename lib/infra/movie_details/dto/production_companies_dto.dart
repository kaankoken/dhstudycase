import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_companies_dto.freezed.dart';
part 'production_companies_dto.g.dart';

@Freezed()
class ProductionCompaniesDto with _$ProductionCompaniesDto {
  const factory ProductionCompaniesDto({
    int? id,
    @JsonKey(name: 'logo_path') String? logoPath,
    String? name,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _ProductionCompaniesDto;

  factory ProductionCompaniesDto.fromJson(Map<String, dynamic> json) => _$ProductionCompaniesDtoFromJson(json);
}
