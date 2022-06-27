import 'package:delivery_hero_flutter_study_case/application/i_use_case.dart';
import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'i_search_use_case.freezed.dart';

@Freezed()
class SearchArguments with _$SearchArguments {
  const factory SearchArguments({
    required String searchText,
    int? pageNumber,
  }) = _SearchArguments;
}

abstract class ISearchUseCase extends IUseCase<UIState<NoParams, SearchModel>, SearchArguments> {}
