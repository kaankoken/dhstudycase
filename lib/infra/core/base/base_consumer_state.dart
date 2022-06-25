import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseConsumerState<T extends ConsumerStatefulWidget> extends ConsumerState<T> with RouteAware {
  StateProvider<bool> screenVisible = StateProvider((_) => true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    if (mounted) {
      ref.read(screenVisible.notifier).update((_) => true);
    }

    routeManager.currentRoute = T.toString();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    if (mounted) {
      ref.read(screenVisible.notifier).update((_) => false);
    }

    super.didPushNext();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    routeManager.currentRoute = T.toString();

    super.initState();
  }
}
