import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_item_model.freezed.dart';

@Freezed()
class SearchItemModel with _$SearchItemModel {
  const factory SearchItemModel({
    String? backdropImage,
    @Default(100) int? id,
    String? posterImage,
    @Default('') String? title,
    @Default(0.0) double? vote,
  }) = _SearchItemModel;
}
