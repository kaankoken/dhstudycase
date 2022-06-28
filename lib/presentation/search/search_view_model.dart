import 'dart:async';

import 'package:delivery_hero_flutter_study_case/application/search/interfaces/i_search_use_case.dart';
import 'package:delivery_hero_flutter_study_case/domain/core/no_params.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_model.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/search_state.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/base/base_view_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/use_case_modules.dart';
import 'package:delivery_hero_flutter_study_case/presentation/core/ui_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends BaseViewModel {
  ScrollController controller = ScrollController();
  FocusNode focusNode = FocusNode();

  late double screenWidth;

  int spanCount = 3;
  TextEditingController textController = TextEditingController();

  StateProvider<Size> widgetSize = StateProvider((ref) => const Size(0, 0));

  final Duration _keyStrokeDuration = const Duration(milliseconds: 800);
  Timer? _timer;

  SearchViewModel(super.ref) {
    controller.addListener(onScroll);
  }

  void calculateItemSize(double width, Orientation orientation) {
    final double totalPadding = ((spanCount - 1) * AppDimensions.padding8) + AppDimensions.padding16 * 2;
    final double result = (width - totalPadding) / spanCount;

    screenWidth = width;

    ref
        .read(widgetSize.notifier)
        .update((_) => Size(result, orientation == Orientation.portrait ? 16 * result / 9 : 9 * result / 16));
  }

  void dispose() {
    focusNode.dispose();
    textController.dispose();
    controller.removeListener(onScroll);
    controller.dispose();
  }

  void navigateToDetailPage(String movieId) {
    // TODO navigate to detail page
  }

  void onChange(String query) {
    _timer?.cancel();
    if (textController.text.length > 1) {
      _timer = Timer(
        _keyStrokeDuration,
        () => _search(query),
      );
    }
  }

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;
    double delta = screenWidth * 0.2;

    if (maxScroll - currentScroll <= delta) {
      ref.read(searchState).maybeWhen(
            success: (data) {
              if ((data.page ?? 0) < (data.totalPages ?? 0)) {
                _search(textController.text, pageNumber: (data.page ?? 0) + 1);
              }
            },
            orElse: () => null,
          );
    }
  }

  Future<void> _search(String text, {int? pageNumber}) async {
    final ISearchUseCase useCase = ref.read(searchUseCase);

    final UIState<NoParams, SearchModel> result = await useCase.invoke(
      SearchArguments(
        searchText: text,
        pageNumber: pageNumber,
      ),
    );

    ref.read(searchState.notifier).update(
      (state) {
        if (text != ref.read(previousText)) {
          return result;
        }

        if (state is Success &&
            result is Success &&
            (((state as Success).data as SearchModel).items ?? []).isNotEmpty) {
          ((result as Success).data as SearchModel).items?.insertAll(
                0,
                ((state as Success).data as SearchModel).items ?? [],
              );

          return result;
        } else {
          return result;
        }
      },
    );
    ref.read(previousText.notifier).update((_) => text);
  }
}
