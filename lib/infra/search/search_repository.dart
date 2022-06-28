import 'package:delivery_hero_flutter_study_case/domain/search/i_search_repository.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/api/i_api_service.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/api/network_manager.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/service_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/util_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/connectivity_util.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:delivery_hero_flutter_study_case/infra/search/dto/search_dto.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchRepository implements ISearchRepository {
  @override
  bool isTest = false;

  late final IApiService _apiService;
  late final ConnectivityUtil _connectivityUtil;
  late final Ref _ref;

  SearchRepository(this._ref)
      : _apiService = _ref.read(apiService),
        _connectivityUtil = _ref.read(connectivityUtil);

  @override
  Future<Either<String, SearchDto>> search(String searchText, {int? pageNumber}) async {
    if (!isTest) {
      if (_ref.read(_connectivityUtil.connectivityController).name == ConnectivityStatus.OFFLINE.name) {
        return Either.left(appStrings.youAreOffline);
      }
    }
    try {
      final query = NetworkManager.baseQueryString;
      query.putIfAbsent('include_adult', () => 'false');
      query.putIfAbsent('page', () => (pageNumber ?? 1).toString());
      query.putIfAbsent('query', () => searchText);

      final result = await _apiService.search(query);

      return Either.right(result);
    } catch (e) {
      return const Either.left('');
      // Report to firebase etc.
    }
  }
}
