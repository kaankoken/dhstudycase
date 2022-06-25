import 'package:delivery_hero_flutter_study_case/infra/core/extensions/remove_slash.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';

class RouteManager {
  String currentRoute = '/';

  static RouteManager? _instance;
  static RouteManager get instance => _instance ??= RouteManager();

  void goNamed(
    String routeName, {
    Object? arguments,
    Map<String, String>? params,
  }) {
    currentRoute = routeName;

    route.goNamed(
      routeName.removeSlash,
      extra: arguments,
      params: params ?? {},
    );
  }

  void pop() {
    route.pop();
  }

  void pushNamed(
    String routeName, {
    Object? arguments,
    Map<String, String>? params,
  }) {
    currentRoute = routeName;

    route.pushNamed(
      routeName.removeSlash,
      extra: arguments,
      params: params ?? {},
    );
  }
}
