import 'package:delivery_hero_flutter_study_case/application/search/interfaces/i_search_use_case.dart';
import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/i_search_repository.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/dto_to_model.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/repository_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/toast.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUseCase implements ISearchUseCase {
  late final ISearchRepository _repository;

  SearchUseCase(Ref ref) : _repository = ref.read(searchRepository);

  @override
  Future<UIState<NoParams, SearchModel>> invoke(SearchArguments param) async {
    final result = await _repository.search(param.searchText, pageNumber: param.pageNumber);

    return result.when(
      left: (left) {
        ToastMessage.toast(left);

        return const UIState.error(NoParams());
      },
      right: (right) => UIState.success(right.model),
    );
  }
}
