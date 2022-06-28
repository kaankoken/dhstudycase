import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_hero_flutter_study_case/domain/movie_detail/movie_detail_state.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_item_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/base/base_consumer_state.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_colors.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/view_model_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:delivery_hero_flutter_study_case/presentation/shared/skeleton_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailView extends ConsumerStatefulWidget {
  final SearchItemModel searchItem;
  const MovieDetailView({Key? key, required this.searchItem}) : super(key: key);

  @override
  MovieDetailState createState() => MovieDetailState();
}

class MovieDetailState extends BaseConsumerState<MovieDetailView> {
  String url = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => routeManager.pop(),
        ),
        title: Text(widget.searchItem.title ?? ''),
      ),
      body: Stack(
        children: [
          ref.watch(movieState).maybeWhen(
                loading: () => Container(
                  color: AppColors.BLACK,
                ),
                success: (data) => CachedNetworkImage(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  imageUrl: url + (data.backdropImage ?? ''),
                  placeholder: (context, data) => SkeletonContainer(
                    radius: 0,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  errorWidget: (_, error, errorObj) => SkeletonContainer(
                    radius: 0,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    isAnimated: false,
                  ),
                ),
                orElse: () => const SizedBox.shrink(),
              ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                      imageUrl: (widget.searchItem.posterImage ?? widget.searchItem.backdropImage ?? '').isEmpty
                          ? ''
                          : url + (widget.searchItem.posterImage ?? widget.searchItem.backdropImage ?? ''),
                      placeholder: (context, data) => SkeletonContainer(
                        radius: 0,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      errorWidget: (_, error, errorObj) => SkeletonContainer(
                        radius: 0,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.3,
                        isAnimated: false,
                      ),
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            bottom: AppDimensions.padding8,
                          ),
                          child: AutoSizeText(
                            (widget.searchItem.vote ?? 0.0).toString(),
                            maxFontSize: 16,
                            style: TextStyle(
                              backgroundColor: AppColors.BLACK,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.WHITE,
                            ),
                          ),
                        ),
                        Container(
                          color: AppColors.BLACK,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: AutoSizeText(
                            widget.searchItem.title ?? '',
                            maxFontSize: 16,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.WHITE,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppDimensions.padding8),
              Expanded(
                child: ref.watch(movieState).maybeWhen(
                      success: (data) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.overview ?? '',
                            style: TextStyle(
                              color: AppColors.WHITE,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.padding8),
                          Text(
                            data.genres?.map((e) => '${e.name} ').toList().toString() ?? '',
                            style: TextStyle(
                              color: AppColors.WHITE,
                            ),
                          ),
                        ],
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(movieDetailViewModel).getMovieDetail(widget.searchItem.id ?? 0);
      },
    );
  }
}
