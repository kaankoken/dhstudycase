import 'package:delivery_hero_flutter_study_case/application/search/interfaces/i_search_use_case.dart';
import 'package:delivery_hero_flutter_study_case/application/search/search_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> useCaseModule() async {
  searchUseCase = Provider((ref) => SearchUseCase(ref));
}

late final Provider<ISearchUseCase> searchUseCase;
