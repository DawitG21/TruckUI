// import 'dart:convert';

import 'package:truck_booking_admin/models/quotation.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `FoodItem` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'commission.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
/// call  flutter pub run build_runner watch  command in VS Terminal on root app directory
@JsonSerializable(explicitToJson: true)
class Commission {
  String? id;
  double? driverEarning;
  double? companyEarning;
  double? totalEarning;
  double? taxAmount;
  double? finalFare;
  double? driverToCompany;
  double? companyToDriver;
  double? wallet;
  double? cash;
  int? totalBookings;
  List<Quotation>? quotations;

  Commission({
    required this.id,
    required this.driverEarning,
    required this.companyEarning,
    required this.totalEarning,
    required this.taxAmount,
    required this.finalFare,
    required this.driverToCompany,
    required this.companyToDriver,
    required this.wallet,
    required this.cash,
    required this.totalBookings,
    required this.quotations,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$AddressFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Commission.fromJson(Map<String, dynamic> json) =>
      _$CommissionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RAddressToJson`.
  Map<String, dynamic> toJson() => _$CommissionToJson(this);
}
//copy and paste it and call  flutter pub run build_runner watch

