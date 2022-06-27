import 'package:delivery_hero_flutter_study_case/infra/core/utils/either.dart';
import 'package:delivery_hero_flutter_study_case/infra/search/dto/search_dto.dart';

abstract class ISearchRepository {
  Future<Either<String, SearchDto>> search(String searchText, {int? pageNumber});
}
