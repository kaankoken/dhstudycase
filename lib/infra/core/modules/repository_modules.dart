import 'package:delivery_hero_flutter_study_case/domain/search/i_search_repository.dart';
import 'package:delivery_hero_flutter_study_case/infra/search/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> repositoryModule() async {
  searchRepository = Provider((ref) => SearchRepository(ref));
}

late final Provider<ISearchRepository> searchRepository;
