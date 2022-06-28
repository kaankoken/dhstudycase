import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/models/movie_detail_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieState = StateProvider<UIState<NoParams, MovieDetailModel>>((_) => const UIState.idle());
