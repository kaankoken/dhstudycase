import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: constant_identifier_names
enum ConnectivityStatus { ONLINE, OFFLINE, NONE }

class ConnectivityUtil {
  final StateProvider<ConnectivityStatus> connectivityController =
      StateProvider<ConnectivityStatus>((ref) => ConnectivityStatus.NONE);

  final Connectivity _connectivity = Connectivity();
  late final Ref _ref;
  late final StreamProvider<ConnectivityResult> _subscription = StreamProvider<ConnectivityResult>(
    (ref) => _connectivity.onConnectivityChanged,
  );

  ConnectivityUtil(this._ref) {
    initConnectivity();
    _listenConnectivityChange();
  }

  // Getting initial network status
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }

    return _updateConnectionStatus(result);
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        return ConnectivityStatus.OFFLINE;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;
      default:
        return ConnectivityStatus.NONE;
    }
  }

  Future<void> _listenConnectivityChange() async {
    _ref.watch(_subscription.stream).listen(
      (result) {
        _updateConnectionStatus(result);
      },
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _ref.read(connectivityController.notifier).update((_) => _getStatusFromResult(result));
  }
}
