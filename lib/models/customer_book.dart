import 'dart:convert';

class CustomerBooking {
  String? id;
  String? name;
  String? email;
  String? phone;
  int? bookingNumber;
  int? totalFare;

  CustomerBooking({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.bookingNumber,
    required this.totalFare,
  });

  factory CustomerBooking.fromJson(Map<String, dynamic> jsonData) {
    return CustomerBooking(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        bookingNumber: jsonData['bookingNumber'],
        totalFare: jsonData['totalFare']);
  }

  static Map<String, dynamic> toMap(CustomerBooking customerBooking) => {
        'id': customerBooking.id,
        'name': customerBooking.name,
        'email': customerBooking.email,
        'phone': customerBooking.phone,
        'bookingNumber': customerBooking.bookingNumber,
        'totalFare': customerBooking.totalFare,
      };

  static String encode(List<CustomerBooking> customerBooking) => json.encode(
        customerBooking
            .map<Map<String, dynamic>>(
                (customerBooking) => CustomerBooking.toMap(customerBooking))
            .toList(),
      );

  static List<CustomerBooking> decode(String customerBookings) =>
      (json.decode(customerBookings) as List<dynamic>)
          .map<CustomerBooking>((item) => CustomerBooking.fromJson(item))
          .toList();
}
