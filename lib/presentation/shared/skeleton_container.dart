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
  late Animation<double> fadeInFadeOut;

  @override
  Widget build(BuildContext context) {
    return widget.isAnimated
        ? FadeTransition(
            opacity: fadeInFadeOut,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: AppColors.LIGHT_GREY,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.radius ?? 0),
                ),
              ),
            ),
          )
        : Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: AppColors.LIGHT_GREY,
              borderRadius: BorderRadius.all(
                Radius.circular(widget.radius ?? 0),
              ),
            ),
          );
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_listener);
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animationController.addStatusListener(_listener);
    animationController.forward();
    fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.2).animate(animationController);
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }
}
