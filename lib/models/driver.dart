import 'dart:convert';

class Driver {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? city;
  String? plateNumber;
  String? truckCategory;
  String? date;
  bool? isActive;
  String? holdingName;
  String? accountNumber;
  String? bankName;
  String? ifscCode;

  Driver(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.city,
      required this.plateNumber,
      this.truckCategory,
      this.date,
      this.isActive,
      this.holdingName,
      this.accountNumber,
      this.bankName,
      this.ifscCode});

  factory Driver.fromJson(Map<String, dynamic> jsonData) {
    return Driver(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        city: jsonData['city'],
        plateNumber: jsonData['plateNumber'],
        truckCategory: jsonData['truckCategory'],
        date: jsonData['date'],
        isActive: jsonData['isActive'],
        holdingName: jsonData['holdingName'],
        accountNumber: jsonData['accountNumber'],
        bankName: jsonData['bankName'],
        ifscCode: jsonData['ifscCode']);
  }

  static Map<String, dynamic> toMap(Driver driver) => {
        'id': driver.id,
        'name': driver.name,
        'email': driver.email,
        'phone': driver.phone,
        'city': driver.city,
        'plateNumber': driver.plateNumber,
        'truckCategory': driver.truckCategory,
        'date': driver.date,
        'isActive': driver.isActive,
        'holdingName': driver.holdingName,
        'accountNumber': driver.accountNumber,
        'bankName': driver.bankName,
        'ifscCode': driver.ifscCode
      };

  static String encode(List<Driver> driver) => json.encode(
        driver
            .map<Map<String, dynamic>>((driver) => Driver.toMap(driver))
            .toList(),
      );

  static List<Driver> decode(String drivers) =>
      (json.decode(drivers) as List<dynamic>)
          .map<Driver>((item) => Driver.fromJson(item))
          .toList();
}
