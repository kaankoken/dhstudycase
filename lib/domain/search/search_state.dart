import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchState = StateProvider<UIState<NoParams, SearchModel>>((_) => const UIState.idle());
final previousText = StateProvider<String>((_) => '');
