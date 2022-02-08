// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRides _$CancelRidesFromJson(Map<String, dynamic> json) => CancelRides(
      id: json['id'] as String?,
      cancelReason: json['cancelReason'] as String?,
      cancelType: json['cancelType'] as String?,
      cancelPenalty: json['cancelPenalty'] as int?,
      totalBookings: json['totalBookings'] as int?,
      quotations: (json['quotations'] as List<dynamic>?)
          ?.map((e) => Quotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CancelRidesToJson(CancelRides instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cancelReason': instance.cancelReason,
      'cancelType': instance.cancelType,
      'cancelPenalty': instance.cancelPenalty,
      'totalBookings': instance.totalBookings,
      'quotations': instance.quotations?.map((e) => e.toJson()).toList(),
    };
