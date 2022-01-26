import 'dart:convert';

class DriverBooking {
  String? id;
  String? name;
  String? email;
  String? phone;
  int? bookingNumber;
  int? totalFare;

  DriverBooking({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.bookingNumber,
    required this.totalFare,
  });

  factory DriverBooking.fromJson(Map<String, dynamic> jsonData) {
    return DriverBooking(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        bookingNumber: jsonData['bookingNumber'],
        totalFare: jsonData['totalFare']);
  }

  static Map<String, dynamic> toMap(DriverBooking driverBooking) => {
        'id': driverBooking.id,
        'name': driverBooking.name,
        'email': driverBooking.email,
        'phone': driverBooking.phone,
        'bookingNumber': driverBooking.bookingNumber,
        'totalFare': driverBooking.totalFare,
      };

  static String encode(List<DriverBooking> driverBooking) => json.encode(
        driverBooking
            .map<Map<String, dynamic>>(
                (driverBooking) => DriverBooking.toMap(driverBooking))
            .toList(),
      );

  static List<DriverBooking> decode(String driverBookings) =>
      (json.decode(driverBookings) as List<dynamic>)
          .map<DriverBooking>((item) => DriverBooking.fromJson(item))
          .toList();
}
