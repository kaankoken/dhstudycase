import 'package:delivery_hero_flutter_study_case/domain/search/models/search_item_model.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/search/dto/search_dto.dart';

extension DtoToModel on SearchDto {
  SearchModel get model {
    return SearchModel(
      page: page,
      totalPages: totalPages,
      totalResults: totalResults,
      items: results
          ?.map(
            (e) => SearchItemModel(
              backdropImage: e.backdropPath,
              id: e.id,
              posterImage: e.posterPath,
              title: e.title,
              vote: e.voteAverage,
            ),
          )
          .toList(),
    );
  }
}
