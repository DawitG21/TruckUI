import 'dart:convert';

class Revenue {
  String? id;
  String? quotationId;
  String? customerName;
  String? driverName;
  String? email;
  String? phone;
  int? totalBookings;
  double? totalFare;
  DateTime? pickupDate;
  String? pickupLocation;
  String? dropLocation;
  String? category;
  String? subCategory;
  String? paymentMethod;
  String? status;

  Revenue({
    required this.id,
    required this.quotationId,
    required this.customerName,
    required this.driverName,
    required this.email,
    required this.phone,
    required this.totalBookings,
    required this.totalFare,
    required this.pickupDate,
    required this.pickupLocation,
    required this.dropLocation,
    required this.category,
    required this.subCategory,
    required this.paymentMethod,
    required this.status,
  });

  factory Revenue.fromJson(Map<String, dynamic> jsonData) {
    return Revenue(
      id: jsonData['id'],
      quotationId: jsonData['quotationId'],
      customerName: jsonData['customerName'],
      driverName: jsonData['driverName'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      totalBookings: jsonData['totalBookings'],
      totalFare: jsonData['totalFare'],
      pickupDate: DateTime.parse(jsonData['pickupDate']),
      pickupLocation: jsonData['pickupLocation'],
      dropLocation: jsonData['dropLocation'],
      category: jsonData['category'],
      subCategory: jsonData['subcategory'],
      paymentMethod: jsonData['paymentMethod'],
      status: jsonData['status'],
    );
  }

  static Map<String, dynamic> toMap(Revenue revenue) => {
        'id': revenue.id,
        'quotationId': revenue.quotationId,
        'customerName': revenue.customerName,
        'driverName': revenue.driverName,
        'email': revenue.email,
        'phone': revenue.phone,
        'totalBookings': revenue.totalBookings,
        'totalFare': revenue.totalFare,
        'pickupDate': revenue.pickupDate!.toIso8601String(),
        'pickupLocation': revenue.pickupLocation,
        'dropLocation': revenue.dropLocation,
        'category': revenue.category,
        'subCategory': revenue.subCategory,
        'paymentMethod': revenue.paymentMethod,
        'status': revenue.status,
      };

  static String encode(List<Revenue> revenue) => json.encode(
        revenue
            .map<Map<String, dynamic>>((revenue) => Revenue.toMap(revenue))
            .toList(),
      );

  static List<Revenue> decode(String revenues) =>
      (json.decode(revenues) as List<dynamic>)
          .map<Revenue>((item) => Revenue.fromJson(item))
          .toList();
}
