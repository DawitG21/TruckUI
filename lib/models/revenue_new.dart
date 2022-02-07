// import 'dart:convert';

import 'package:truck_booking_admin/models/quotation.dart';
import 'package:json_annotation/json_annotation.dart';
/// This allows the `FoodItem` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'revenue_new.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
/// call  flutter pub run build_runner watch  command in VS Terminal on root app directory
@JsonSerializable(explicitToJson: true)
class RevenueNew {
  String? id;
  double? totalFare;
  int? totalBookings;
  List<Quotation>? quotations;

  RevenueNew({
    required this.id,
    required this.totalFare,
    required this.totalBookings,
    required this.quotations,
  });

  // factory RevenueNew.fromJson(Map<String, dynamic> jsonData) {
  //   return RevenueNew(
  //     id: jsonData['id'],
  //     totalFare: jsonData['totalFare'],
  //     totalBookings: jsonData['totalBookings'],
  //     // quotations: jsonData['quotations'],

  //     quotations: (jsonData['quotations'] as List<dynamic>?)
  //         ?.map((e) => Quotation.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }

  // static Map<String, dynamic> toMap(RevenueNew revenue) => {
  //       'id': revenue.id,
  //       'totalFare': revenue.totalFare,
  //       'totalBookings': revenue.totalBookings,
  //       'quotations': revenue.quotations,
  //     };

  // static String encode(List<RevenueNew> revenue) => json.encode(
  //       revenue
  //           .map<Map<String, dynamic>>((revenue) => RevenueNew.toMap(revenue))
  //           .toList(),
  //     );

  // static List<RevenueNew> decode(String revenues) =>
  //     (json.decode(revenues) as List<dynamic>)
  //         .map<RevenueNew>((item) => RevenueNew.fromJson(item))
  //         .toList();

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$AddressFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory RevenueNew.fromJson(Map<String, dynamic> json) => _$RevenueNewFromJson(json);
  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RAddressToJson`.
  Map<String, dynamic> toJson() => _$RevenueNewToJson(this);
}
//copy and paste it and call  flutter pub run build_runner watch

