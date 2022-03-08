import 'package:truck_booking_admin/models/permissions.dart';
import 'dart:convert';

class Admin {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? password;
  List<Permission>? permissions;

  Admin({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.password,
    this.permissions,
  });

  factory Admin.fromJson(Map<String, dynamic> jsonData) {
    return Admin(
        id: jsonData['id'],
        firstName: jsonData['firstName'],
        lastName: jsonData['lastName'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        address: jsonData['address'],
        password: jsonData['password'],
        permissions: jsonData['permissions']);
  }

  // @override
  // toString() {
  //   String output =
  //       '{id: $id, firstName:$firstName,lastName:$lastName,email: $email, phone:$phone,address:$address, password:$password,permissions:$permissions}';
  //   return output;
  // }

  static Map<String, dynamic> toMap(Admin admin) => {
        'id': admin.id,
        'firstName': admin.firstName,
        'lastName': admin.lastName,
        'email': admin.email,
        'phone': admin.phone,
        'address': admin.address,
        'password': admin.password,
        'permissions': admin.permissions
      };

  static String encode(List<Admin> admins) => json.encode(
        admins
            .map<Map<String, dynamic>>((admin) => Admin.toMap(admin))
            .toList(),
      );

  static List<Admin> decode(String admins) =>
      (json.decode(admins) as List<dynamic>)
          .map<Admin>((item) => Admin.fromJson(item))
          .toList();
}
