import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/customer.dart';

class CustomerProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Customer> customers = [];

  addCustomer(Customer customer) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('customer_key');
    if (catString != null) {
      customers = Customer.decode(catString);
    }
    customers.add(customer);
    final String catObj = Customer.encode(customers);
    await prefs.setString('customer_key', catObj);
  }

  editCustomer(Customer customerObj) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('customer_key');
    if (catString != null) {
      customers = Customer.decode(catString);
    }
    for (int i = 0; i < customers.length; i++) {
      if (customers[i].id == customerObj.id) {
        customers[i].name = customerObj.name;
        customers[i].email = customerObj.email;
        customers[i].phone = customerObj.phone;
        customers[i].isActive = customerObj.isActive;
        customers[i].address = customerObj.address;
      }
    }
    final String cusObj = Customer.encode(customers);
    await prefs.setString('customer_key', cusObj);
  }

  deleteCustomer(id) async {
    final SharedPreferences prefs = await _prefs;
    final String? catString = prefs.getString('customer_key');
    if (catString != null) {
      customers = Customer.decode(catString);
    }
    customers.removeWhere((element) => element.id == id);
    final String cusObj = Customer.encode(customers);
    await prefs.setString('customer_key', cusObj);
  }
}
