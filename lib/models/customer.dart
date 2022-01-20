import 'dart:convert';

class Customer {
  String? id;
  String? name;
  String? email;
  String? phone;
  DateTime? date;
  bool? isActive;
  String? address;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.date,
    required this.isActive,
    required this.address,
  });

  factory Customer.fromJson(Map<String, dynamic> jsonData) {
    return Customer(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      date: DateTime.parse(jsonData['date']),
      isActive: jsonData['isActive'],
      address: jsonData['address'],
    );
  }

  static Map<String, dynamic> toMap(Customer customer) => {
        'id': customer.id,
        'name': customer.name,
        'email': customer.email,
        'phone': customer.phone,
        'date': customer.date!.toIso8601String(),
        'isActive': customer.isActive,
        'address': customer.address,
      };

  static String encode(List<Customer> customer) => json.encode(
        customer
            .map<Map<String, dynamic>>((customer) => Customer.toMap(customer))
            .toList(),
      );

  static List<Customer> decode(String customers) =>
      (json.decode(customers) as List<dynamic>)
          .map<Customer>((item) => Customer.fromJson(item))
          .toList();
}
