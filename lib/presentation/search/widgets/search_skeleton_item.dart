import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:delivery_hero_flutter_study_case/presentation/shared/skeleton_container.dart';
import 'package:flutter/widgets.dart';

class SearchSkeletonItem extends StatelessWidget {
  final int itemSize;
  final Size size;
  final int spanCount;

  const SearchSkeletonItem({
    Key? key,
    required this.itemSize,
    required this.size,
    required this.spanCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemSize,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: spanCount,
        mainAxisSpacing: AppDimensions.padding8,
        crossAxisSpacing: AppDimensions.padding8,
      ),
      itemBuilder: (_, index) => SkeletonContainer(
        width: size.width,
        height: size.height,
      ),
    );
  }
}
