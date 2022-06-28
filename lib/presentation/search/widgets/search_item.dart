import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_item_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_colors.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:delivery_hero_flutter_study_case/presentation/shared/skeleton_container.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final double height;
  final SearchItemModel item;
  final VoidCallback onTap;
  final double width;

  const SearchItem({
    Key? key,
    required this.item,
    required this.height,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/w500';

    url = (item.posterImage ?? item.backdropImage ?? '').isEmpty
        ? ''
        : url + (item.posterImage ?? item.backdropImage ?? '');

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Wrap(
          children: [
            CachedNetworkImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
              height: height,
              width: width,
              imageUrl: url,
              placeholder: (context, data) => SkeletonContainer(
                radius: 0,
                width: width,
                height: height,
              ),
              errorWidget: (_, error, errorObj) => SkeletonContainer(
                radius: 0,
                width: width,
                height: height,
                isAnimated: false,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: AppDimensions.padding5,
                    bottom: AppDimensions.padding5,
                  ),
                  child: Container(
                    color: AppColors.BLACK,
                    width: width,
                    child: AutoSizeText(
                      (item.vote ?? 0.0).toString(),
                      maxFontSize: 16,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.WHITE,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.BLACK,
                  width: width,
                  child: AutoSizeText(
                    item.title ?? '',
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
    );
  }
}
