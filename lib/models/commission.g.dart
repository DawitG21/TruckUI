// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commission _$CommissionFromJson(Map<String, dynamic> json) => Commission(
      id: json['id'] as String?,
      driverEarning: (json['driverEarning'] as num?)?.toDouble(),
      companyEarning: (json['companyEarning'] as num?)?.toDouble(),
      totalEarning: (json['totalEarning'] as num?)?.toDouble(),
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      finalFare: (json['finalFare'] as num?)?.toDouble(),
      driverToCompany: (json['driverToCompany'] as num?)?.toDouble(),
      companyToDriver: (json['companyToDriver'] as num?)?.toDouble(),
      wallet: (json['wallet'] as num?)?.toDouble(),
      cash: (json['cash'] as num?)?.toDouble(),
      totalBookings: json['totalBookings'] as int?,
      quotations: (json['quotations'] as List<dynamic>?)
          ?.map((e) => Quotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommissionToJson(Commission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverEarning': instance.driverEarning,
      'companyEarning': instance.companyEarning,
      'totalEarning': instance.totalEarning,
      'taxAmount': instance.taxAmount,
      'finalFare': instance.finalFare,
      'driverToCompany': instance.driverToCompany,
      'companyToDriver': instance.companyToDriver,
      'wallet': instance.wallet,
      'cash': instance.cash,
      'totalBookings': instance.totalBookings,
      'quotations': instance.quotations?.map((e) => e.toJson()).toList(),
    };
