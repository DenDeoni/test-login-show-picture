import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

@immutable
class ResponseModel {
  const ResponseModel({
    required this.data,
    this.success,
    this.reason,
  });

  final String data;
  final bool? success;
  final String? reason;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: json['image'],
        success: json['success'] ?? true,
        reason: json['reason'] ?? '',
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseModel && data == other.data && success == other.success && reason == other.reason;

  @override
  int get hashCode => data.hashCode ^ success.hashCode ^ reason.hashCode;
}

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
