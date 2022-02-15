// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reasons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelReasons _$CancelReasonsFromJson(Map<String, dynamic> json) =>
    CancelReasons(
      id: json['id'] as String?,
      reasonType: json['reasonType'] as String?,
      reasonFor: json['reasonFor'] as String?,
      reason: json['reason'] as String?,
      cancelPrice: (json['cancelPrice'] as num?)?.toDouble(),
      cancelDuration: json['cancelDuration'] as int?,
      cancelType: json['cancelType'] as bool? ?? false,
    );

Map<String, dynamic> _$CancelReasonsToJson(CancelReasons instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reasonType': instance.reasonType,
      'reasonFor': instance.reasonFor,
      'reason': instance.reason,
      'cancelPrice': instance.cancelPrice,
      'cancelDuration': instance.cancelDuration,
      'cancelType': instance.cancelType,
    };
