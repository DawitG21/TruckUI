import 'dart:convert';

class DriverBookingDetails {
  String? id;
  String? quotationId;
  DateTime? date;
  String? orderStatus;
  int? totalFare;

  DriverBookingDetails({
    required this.id,
    required this.quotationId,
    required this.date,
    required this.orderStatus,
    required this.totalFare,
  });

  factory DriverBookingDetails.fromJson(Map<String, dynamic> jsonData) {
    return DriverBookingDetails(
        id: jsonData['id'],
        quotationId: jsonData['quotationId'],
        date: DateTime.parse(jsonData['date']),
        orderStatus: jsonData['orderStatus'],
        totalFare: jsonData['totalFare']);
  }

  static Map<String, dynamic> toMap(DriverBookingDetails driverBookingDetail) =>
      {
        'id': driverBookingDetail.id,
        'quotationId': driverBookingDetail.quotationId,
        'date': driverBookingDetail.date!.toIso8601String(),
        'orderStatus': driverBookingDetail.orderStatus,
        'totalFare': driverBookingDetail.totalFare,
      };

  static String encode(List<DriverBookingDetails> driverBookingDetail) =>
      json.encode(
        driverBookingDetail
            .map<Map<String, dynamic>>(
                (driverBooking) => DriverBookingDetails.toMap(driverBooking))
            .toList(),
      );

  static List<DriverBookingDetails> decode(String driverBookingDetails) => (json
          .decode(driverBookingDetails) as List<dynamic>)
      .map<DriverBookingDetails>((item) => DriverBookingDetails.fromJson(item))
      .toList();
}
