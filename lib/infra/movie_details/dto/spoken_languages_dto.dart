import 'package:freezed_annotation/freezed_annotation.dart';

part 'spoken_languages_dto.freezed.dart';
part 'spoken_languages_dto.g.dart';

@Freezed()
class SpokenLanguagesDto with _$SpokenLanguagesDto {
  const factory SpokenLanguagesDto({
    @JsonKey(name: 'iso_639_1') String? iso6391,
    String? name,
  }) = _SpokenLanguagesDto;

  factory SpokenLanguagesDto.fromJson(Map<String, dynamic> json) => _$SpokenLanguagesDtoFromJson(json);
}
