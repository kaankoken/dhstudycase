import 'dart:io';

import 'package:delivery_hero_flutter_study_case/domain/core/i_route.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/models/search_item_model.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/extensions/remove_slash.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/routes/app_routes.dart';
import 'package:delivery_hero_flutter_study_case/presentation/movie_detail/movie_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieDetailRoute implements IRoute {
  @override
  GoRoute get route => GoRoute(
        path: AppRoutes.MOVIE_DETAIL,
        name: AppRoutes.MOVIE_DETAIL.removeSlash,
        pageBuilder: (context, state) => Platform.isAndroid
            ? MaterialPage(
                child: MovieDetailView(
                  searchItem: state.extra as SearchItemModel,
                ),
                arguments: state.extra,
                fullscreenDialog: true,
              )
            : CupertinoPage(
                child: MovieDetailView(
                  searchItem: state.extra as SearchItemModel,
                ),
                arguments: state.extra,
                fullscreenDialog: true,
              ),
      );
}
