import 'package:delivery_hero_flutter_study_case/domain/movie_detail/movie_detail_route.dart';
import 'package:delivery_hero_flutter_study_case/domain/search/search_route.dart';
import 'package:delivery_hero_flutter_study_case/domain/splash/splash_route.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter get router => GoRouter(
        initialLocation: AppRoutes.SPLASH,
        routes: [
          MovieDetailRoute().route,
          SplashRoute().route,
          SearchRoute().route,
        ],
      );
}
