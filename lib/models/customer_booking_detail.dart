import 'dart:convert';

class CustomerBookDetails {
  String? id;
  String? quotationId;
  DateTime? date;
  String? orderStatus;
  int? totalFare;
  String? pickup;
  String? drop;
  String? category;
  String? subCategory;
  String? paymentMethod;
  int? tax;
  int? discount;

  CustomerBookDetails({
    required this.id,
    required this.quotationId,
    required this.date,
    required this.orderStatus,
    required this.totalFare,
    this.pickup,
    this.drop,
    this.category,
  });

  factory CustomerBookDetails.fromJson(Map<String, dynamic> jsonData) {
    return CustomerBookDetails(
      id: jsonData['id'],
      quotationId: jsonData['quotationId'],
      date: DateTime.parse(jsonData['date']),
      orderStatus: jsonData['orderStatus'],
      totalFare: jsonData['totalFare'],
      pickup: jsonData['pickup'],
      drop: jsonData['drop'],
      category: jsonData['category'],
    );
  }

  static Map<String, dynamic> toMap(
          CustomerBookDetails customerBookingDetail) =>
      {
        'id': customerBookingDetail.id,
        'quotationId': customerBookingDetail.quotationId,
        'date': customerBookingDetail.date!.toIso8601String(),
        'orderStatus': customerBookingDetail.orderStatus,
        'totalFare': customerBookingDetail.totalFare,
        'pickup': customerBookingDetail.pickup,
        'drop': customerBookingDetail.drop,
        'category': customerBookingDetail.category,
      };

  static String encode(List<CustomerBookDetails> customerBookingDetail) =>
      json.encode(
        customerBookingDetail
            .map<Map<String, dynamic>>(
                (customerBooking) => CustomerBookDetails.toMap(customerBooking))
            .toList(),
      );

  static List<CustomerBookDetails> decode(String customerBookingDetails) =>
      (json.decode(customerBookingDetails) as List<dynamic>)
          .map<CustomerBookDetails>(
              (item) => CustomerBookDetails.fromJson(item))
          .toList();
}
