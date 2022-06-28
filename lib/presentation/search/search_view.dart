import 'dart:ui';

import 'package:delivery_hero_flutter_study_case/domain/search/models/search_item_model.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/search_state.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/base/base_consumer_state.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_colors.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/view_model_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:delivery_hero_flutter_study_case/presentation/search/search_view_model.dart';
import 'package:delivery_hero_flutter_study_case/presentation/search/widgets/search_item.dart';
import 'package:delivery_hero_flutter_study_case/presentation/search/widgets/search_skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends BaseConsumerState<SearchView> {
  late SearchViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BLACK,
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          controller: _viewModel.controller,
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.BLACK,
              elevation: 0,
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                height: 60,
                color: AppColors.BLACK,
                child: TextField(
                  onChanged: _viewModel.onChange,
                  controller: _viewModel.textController,
                  focusNode: _viewModel.focusNode,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autocorrect: true,
                  style: TextStyle(
                    color: AppColors.WHITE,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: appStrings.search,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.WHITE)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.WHITE)),
                    border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.WHITE)),
                    iconColor: AppColors.WHITE,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.WHITE,
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.padding16),
              sliver: ref.watch(searchState).maybeWhen(
                    success: (data) => SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _viewModel.spanCount,
                        mainAxisSpacing: AppDimensions.padding8,
                        childAspectRatio:
                            ref.read(_viewModel.widgetSize).width / ref.read(_viewModel.widgetSize).height,
                        crossAxisSpacing: AppDimensions.padding8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final size = ref.read(_viewModel.widgetSize);

                          if ((data.items ?? []).isEmpty) {
                            return SearchSkeletonItem(
                              itemSize: 12,
                              size: ref.read(_viewModel.widgetSize),
                              spanCount: _viewModel.spanCount,
                            );
                          }

                          final item = data.items?.getRange(index, index + 1).first ?? const SearchItemModel();

                          return SearchItem(
                            width: size.width,
                            height: size.height,
                            onTap: () => _viewModel.navigateToDetailPage(
                              item.id.toString(),
                              item,
                            ),
                            item: item,
                          );
                        },
                        childCount: data.items?.length,
                      ),
                    ),
                    orElse: () => SliverToBoxAdapter(
                      child: SearchSkeletonItem(
                        itemSize: 12,
                        size: ref.read(_viewModel.widgetSize),
                        spanCount: _viewModel.spanCount,
                      ),
                    ),
                  ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(searchViewModel);

    final pixelRatio = window.devicePixelRatio;

    final logicalScreenSize = window.physicalSize / pixelRatio;
    final logicalWidth = logicalScreenSize.width;

    _viewModel.calculateItemSize(logicalWidth, Orientation.portrait);

    WidgetsBinding.instance.addPostFrameCallback((_) => _viewModel.focusNode.requestFocus());
  }
}
