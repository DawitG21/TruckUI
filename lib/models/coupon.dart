import 'dart:convert';

class Coupon {
  String? id;
  String? code;
  int? percentage;
  DateTime? startDate;
  DateTime? endDate;

  Coupon({
    required this.id,
    required this.code,
    required this.percentage,
    required this.startDate,
    required this.endDate,
  });

  factory Coupon.fromJson(Map<String, dynamic> jsonData) {
    return Coupon(
      id: jsonData['id'],
      code: jsonData['code'],
      percentage: jsonData['percentage'],
      startDate: DateTime.parse(jsonData['startDate']),
      endDate: DateTime.parse(jsonData['endDate']),
    );
  }

  static Map<String, dynamic> toMap(Coupon coupon) => {
        'id': coupon.id,
        'code': coupon.code,
        'percentage': coupon.percentage,
        'startDate': coupon.startDate!.toIso8601String(),
        'endDate': coupon.endDate!.toIso8601String(),
      };

  static String encode(List<Coupon> coupon) => json.encode(
        coupon
            .map<Map<String, dynamic>>((coupon) => Coupon.toMap(coupon))
            .toList(),
      );

  static List<Coupon> decode(String coupon) =>
      (json.decode(coupon) as List<dynamic>)
          .map<Coupon>((item) => Coupon.fromJson(item))
          .toList();
}
