import 'dart:convert';

class Customer {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? date;
  bool? isActive;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.date,
    required this.isActive,
  });

  factory Customer.fromJson(Map<String, dynamic> jsonData) {
    return Customer(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      date: jsonData['date'],
      isActive: jsonData['isActive'],
    );
  }

  static Map<String, dynamic> toMap(Customer customer) => {
        'id': customer.id,
        'name': customer.name,
        'email': customer.email,
        'phone': customer.phone,
        'date': customer.date,
        'isActive': customer.isActive,
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
