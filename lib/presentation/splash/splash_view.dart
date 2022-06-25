import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_colors.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_dimensions.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/modules/view_model_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:delivery_hero_flutter_study_case/presentation/shared/loading/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(splashViewModel.select((value) => value.isDarkMode)) ? AppColors.RED : AppColors.WHITE,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AutoSizeText(
            appStrings.loading,
            minFontSize: 12,
            maxFontSize: 16,
            style: TextStyle(
              color: ref.watch(splashViewModel.select((value) => value.isDarkMode)) ? AppColors.WHITE : AppColors.RED,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimensions.padding64),
            child: CircularLoading(
              color: ref.watch(splashViewModel.select((value) => value.isDarkMode)) ? AppColors.WHITE : AppColors.RED,
            ),
          ),
        ],
      ),
    );
  }
}
