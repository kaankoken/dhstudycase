import 'dart:async';

import 'package:delivery_hero_flutter_study_case/infra/core/base/base_view_model.dart';
import 'package:flutter/widgets.dart';

class SearchViewModel extends BaseViewModel {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  final Duration _keyStrokeDuration = const Duration(milliseconds: 800);
  Timer? _timer;

  SearchViewModel(super.ref);

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
