// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quotation _$QuotationFromJson(Map<String, dynamic> json) => Quotation(
      quotationId: json['quotationId'] as String?,
      customerName: json['customerName'] as String?,
      customerEmail: json['customerEmail'] as String?,
      customerPhone: json['customerPhone'] as String?,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      driverQuotedAmount: (json['driverQuotedAmount'] as num?)?.toDouble(),
      pickupDate: json['pickupDate'] == null
          ? null
          : DateTime.parse(json['pickupDate'] as String),
      pickupLocation: json['pickupLocation'] as String?,
      dropLocation: json['dropLocation'] as String?,
      truckCategory: json['truckCategory'] as String?,
      truckSubCategory: json['truckSubCategory'] as String?,
      recieverName: json['recieverName'] as String?,
      revieverPhone: json['revieverPhone'] as String?,
      quoteDate: json['quoteDate'] == null
          ? null
          : DateTime.parse(json['quoteDate'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$QuotationToJson(Quotation instance) => <String, dynamic>{
      'quotationId': instance.quotationId,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'customerPhone': instance.customerPhone,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'driverQuotedAmount': instance.driverQuotedAmount,
      'pickupDate': instance.pickupDate?.toIso8601String(),
      'pickupLocation': instance.pickupLocation,
      'dropLocation': instance.dropLocation,
      'truckCategory': instance.truckCategory,
      'truckSubCategory': instance.truckSubCategory,
      'recieverName': instance.recieverName,
      'revieverPhone': instance.revieverPhone,
      'quoteDate': instance.quoteDate?.toIso8601String(),
      'status': instance.status,
    };
