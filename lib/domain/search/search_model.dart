import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';

@Freezed()
class SearchModel with _$SearchModel {
  const factory SearchModel({
    String? backdropImage,
    @Default(100) int id,
    String? posterImage,
    @Default('') String title,
    @Default(0.0) double vote,
  }) = _SearchModel;
}
