import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseViewModel {
  late final Ref ref;

  BaseViewModel(this.ref);
}
