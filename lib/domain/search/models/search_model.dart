import 'package:delivery_hero_flutter_study_case/domain/search/models/search_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';

@Freezed()
class SearchModel with _$SearchModel {
  const factory SearchModel({
    int? page,
    int? totalResults,
    int? totalPages,
    List<SearchItemModel>? items,
  }) = _SearchModel;
}
