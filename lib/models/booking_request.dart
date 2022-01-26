import 'dart:convert';

class BookingRequest {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? category;
  DateTime? date;
  bool? isActive;

  BookingRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.category,
    required this.date,
    required this.isActive,
  });

  factory BookingRequest.fromJson(Map<String, dynamic> jsonData) {
    return BookingRequest(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      category: jsonData['category'],
      date: DateTime.parse(jsonData['date']),
      isActive: jsonData['isActive'],
    );
  }

  static Map<String, dynamic> toMap(BookingRequest bookingRequest) => {
        'id': bookingRequest.id,
        'name': bookingRequest.name,
        'email': bookingRequest.email,
        'phone': bookingRequest.phone,
        'category': bookingRequest.category,
        'date': bookingRequest.date!.toIso8601String(),
        'isActive': bookingRequest.isActive,
      };

  static String encode(List<BookingRequest> bookingRequest) => json.encode(
        bookingRequest
            .map<Map<String, dynamic>>(
                (bookingRequest) => BookingRequest.toMap(bookingRequest))
            .toList(),
      );

  static List<BookingRequest> decode(String bookingRequest) =>
      (json.decode(bookingRequest) as List<dynamic>)
          .map<BookingRequest>((item) => BookingRequest.fromJson(item))
          .toList();
}
