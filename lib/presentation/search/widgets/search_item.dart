import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/search_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_colors.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:delivery_hero_flutter_study_case/presentation/shared/skeleton_container.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final double height;
  final SearchModel item;
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
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            CachedNetworkImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              imageUrl: item.posterImage ?? item.backdropImage ?? '',
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
            const Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppDimensions.padding5,
                bottom: AppDimensions.padding5,
              ),
            ),
            Container(
              color: AppColors.BLACK,
              width: width,
              child: AutoSizeText(
                item.title,
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
      ),
    );
  }
}
