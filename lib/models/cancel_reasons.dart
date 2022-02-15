// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:json_annotation/json_annotation.dart';

part 'cancel_reasons.g.dart';

@JsonSerializable(explicitToJson: true)
class CancelReasons {
  String? id;
  String? reasonType;
  String? reasonFor;
  String? reason;
  var cancelPrice;
  var cancelDuration;
  bool? cancelType;

  CancelReasons({
    this.id,
    this.reasonType,
    this.reasonFor,
    this.reason,
    this.cancelPrice,
    this.cancelDuration,
    this.cancelType = false,
  });

  factory CancelReasons.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonsFromJson(json);

  Map<String, dynamic> toJson() => _$CancelReasonsToJson(this);
}
