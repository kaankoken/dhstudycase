import 'dart:async';

import 'package:delivery_hero_flutter_study_case/infra/core/base/base_view_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends BaseViewModel {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  int spanCount = 3;

  StateProvider<Size> widgetSize = StateProvider((ref) => const Size(0, 0));

  final Duration _keyStrokeDuration = const Duration(milliseconds: 800);
  Timer? _timer;

  SearchViewModel(super.ref);

  void calculateItemSize(double width, Orientation orientation) {
    final double totalPadding = (spanCount - 1) * AppDimensions.padding8;
    final double result = (width - totalPadding) / spanCount;

    ref
        .read(widgetSize.notifier)
        .update((_) => Size(result, orientation == Orientation.portrait ? 16 * result / 9 : 9 * result / 16));
  }

  void onChange(String query) {
    _timer?.cancel();
    _timer = Timer(
      _keyStrokeDuration,
      () => {
        // TODO:  search use case
      },
    );
  }
}
