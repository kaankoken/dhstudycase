import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';
part 'failure.g.dart';

@Freezed()
class Failure with _$Failure {
  const factory Failure({
    @JsonKey(name: 'status_message') required String statusMessage,
    @JsonKey(name: 'status_code') required int statusCode,
    bool? success,
  }) = _Failure;

  factory Failure.fromJson(Map<String, dynamic> json) => _$FailureFromJson(json);
}
