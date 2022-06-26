import 'package:delivery_hero_flutter_study_case/infra/core/utils/connectivity_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> utilModule() async {
  connectivityUtil = Provider.autoDispose((ref) => ConnectivityUtil(ref));
}

late final AutoDisposeProvider<ConnectivityUtil> connectivityUtil;
