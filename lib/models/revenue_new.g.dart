// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevenueNew _$RevenueNewFromJson(Map<String, dynamic> json) => RevenueNew(
      id: json['id'] as String?,
      totalFare: (json['totalFare'] as num?)?.toDouble(),
      totalBookings: json['totalBookings'] as int?,
      quotations: (json['quotations'] as List<dynamic>?)
          ?.map((e) => Quotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RevenueNewToJson(RevenueNew instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalFare': instance.totalFare,
      'totalBookings': instance.totalBookings,
      'quotations': instance.quotations?.map((e) => e.toJson()).toList(),
    };
