import 'package:delivery_hero_flutter_study_case/infra/core/modules/util_modules.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/connectivity_util.dart';
import 'package:delivery_hero_flutter_study_case/infra/core/utils/toast.dart';
import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const ConnectivityWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  ConnectivtyWrapperState createState() => ConnectivtyWrapperState();
}

class ConnectivtyWrapperState extends ConsumerState<ConnectivityWrapper> {
  late ConnectivityUtil _connectivityUtil;

  @override
  Widget build(BuildContext context) {
    final connectivityController = ref.watch(_connectivityUtil.connectivityController);

    if (connectivityController.name == ConnectivityStatus.OFFLINE.name) {
      ToastMessage.toast(appStrings.youAreOffline);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return widget.child;
      },
    );
  }

  @override
  void initState() {
    _connectivityUtil = ref.read(connectivityUtil);

    super.initState();
  }
}
