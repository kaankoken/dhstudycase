import 'dart:io';

import 'package:delivery_hero_flutter_study_case/domain/core/i_route.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/extensions/remove_slash.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/routes/app_routes.dart';
import 'package:delivery_hero_flutter_study_case/presentation/search/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchRoute implements IRoute {
  @override
  GoRoute get route => GoRoute(
        path: AppRoutes.SEARCH,
        name: AppRoutes.SEARCH.removeSlash,
        pageBuilder: (context, state) => Platform.isAndroid
            ? MaterialPage(
                child: const SearchView(),
                arguments: state.extra,
                fullscreenDialog: true,
              )
            : CupertinoPage(
                child: const SearchView(),
                arguments: state.extra,
                fullscreenDialog: true,
              ),
      );
}
