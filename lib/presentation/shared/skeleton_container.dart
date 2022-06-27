import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SkeletonContainer extends StatefulWidget {
  final double height;
  final bool isAnimated;
  final double? radius;
  final double width;

  const SkeletonContainer({
    Key? key,
    required this.height,
    required this.width,
    this.radius,
    this.isAnimated = true,
  }) : super(key: key);

  @override
  SkeletonContainerState createState() => SkeletonContainerState();
}

class SkeletonContainerState extends State<SkeletonContainer> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return widget.isAnimated
        ? FadeTransition(
            opacity: animationController.drive(CurveTween(curve: Curves.easeInOut)),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.radius ?? 30),
                ),
                color: AppColors.LIGHT_BLACK,
              ),
            ),
          )
        : Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.radius ?? 30),
              ),
              color: AppColors.LIGHT_BLACK,
            ),
          );
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
  }
}
