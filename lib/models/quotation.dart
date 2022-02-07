// import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'quotation.g.dart';

@JsonSerializable()
class Quotation {
  String? quotationId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  String? driverName;
  String? driverPhone;
  double? driverQuotedAmount;
  DateTime? pickupDate;
  String? pickupLocation;
  String? dropLocation;
  String? truckCategory;
  String? truckSubCategory;
  String? recieverName;
  String? revieverPhone;
  DateTime? quoteDate;
  String? status;

  Quotation({
    required this.quotationId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    this.driverName,
    this.driverPhone,
    this.driverQuotedAmount,
    required this.pickupDate,
    required this.pickupLocation,
    required this.dropLocation,
    required this.truckCategory,
    required this.truckSubCategory,
    required this.recieverName,
    required this.revieverPhone,
    required this.quoteDate,
    required this.status,
  });

  // factory Quotation.fromJson(Map<String, dynamic> jsonData) {
  //   return Quotation(
  //     quotationId: jsonData['quotationId'],
  //     customerName: jsonData['customerName'],
  //     customerEmail: jsonData['customerEmail'],
  //     customerPhone: jsonData['customerPhone'],
  //     driverName: jsonData['driverName'],
  //     driverPhone: jsonData['driverPhone'],
  //     driverQuotedAmount: jsonData['driverQuotedAmount'],
  //     pickupDate: jsonData['pickupDate'],
  //     pickupLocation: jsonData['pickupLocation'],
  //     dropLocation: jsonData['dropLocation'],
  //     truckCategory: jsonData['truckCategory'],
  //     truckSubCategory: jsonData['truckSubCategory'],
  //     recieverName: jsonData['recieverName'],
  //     revieverPhone: jsonData['recieverPhone'],
  //     quoteDate: jsonData['quoteDate'],
  //     status: jsonData['status'],
  //   );
  // }

  // static Map<String, dynamic> toMap(Quotation quote) => {
  //       'quotationId': quote.quotationId,
  //       'customerName': quote.customerName,
  //       'email': quote.customerEmail,
  //       'phone': quote.customerPhone,
  //       'driverName': quote.driverName,
  //       'driverPhone': quote.driverPhone,
  //       'driverQuotedAmount': quote.driverQuotedAmount,
  //       'pickupDate': quote.pickupDate!.toIso8601String(),
  //       'pickupLocation': quote.pickupLocation,
  //       'dropLocation': quote.dropLocation,
  //       'truckCategory': quote.truckCategory,
  //       'truckSubCategory': quote.truckSubCategory,
  //       'recieverName': quote.recieverName,
  //       'recieverPhone': quote.revieverPhone,
  //       'quoteDate': quote.quoteDate!.toIso8601String(),
  //       'status': quote.status,
  //     };

  // static String encode(List<Quotation> quote) => json.encode(
  //       quote
  //           .map<Map<String, dynamic>>((quote) => Quotation.toMap(quote))
  //           .toList(),
  //     );

  // static List<Quotation> decode(String quotes) =>
  //     (json.decode(quotes) as List<dynamic>)
  //         .map<Quotation>((item) => Quotation.fromJson(item))
  //         .toList();


/// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$AddressFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Quotation.fromJson(Map<String, dynamic> json) => _$QuotationFromJson(json);
  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RAddressToJson`.
  Map<String, dynamic> toJson() => _$QuotationToJson(this);
}
//copy and paste it and call  flutter pub run build_runner watch
