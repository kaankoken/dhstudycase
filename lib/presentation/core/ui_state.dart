import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@Freezed()
class UIState<L, R> with _$UIState<L, R> {
  const factory UIState.error(L error) = Error;
  const factory UIState.idle() = Idle;
  const factory UIState.loading() = Loading;
  const factory UIState.success(R data) = Success;
}
