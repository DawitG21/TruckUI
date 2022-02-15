import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/cancel_ride.dart';
import 'package:truck_booking_admin/models/customer.dart';
import 'package:truck_booking_admin/models/quotation.dart';

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

final List<CancelRides> cancelRidesEncoded = [
  CancelRides(
    id: 'ac3c1087-ecec-413f-9fdc-1f7b8ceop',
    cancelReason: 'Driver is late',
    cancelType: 'Chargable',
    cancelPenalty: 50,
    totalBookings: 2,
    quotations: [
      Quotation(
          quotationId: 'Book-000-009',
          customerName: 'Jane Doe',
          customerEmail: 'jane@gmail.com',
          customerPhone: '+251-989-1256',
          pickupDate: DateTime.now(),
          pickupLocation: 'Bole, Airport Road',
          dropLocation: 'CMC, Sunshine Realestate',
          truckCategory: 'Heavy Truck',
          truckSubCategory: '8 Ton',
          recieverName: 'Dawit G',
          revieverPhone: '+251-976-445-590',
          quoteDate: DateTime.now(),
          status: 'Quote Active',
          driverName: 'Habtamu Kebede',
          driverEmail: 'dawitg@gmail.com'),
      Quotation(
          quotationId: 'Book-000-003',
          customerName: 'Jane Doe',
          customerEmail: 'jane@gmail.com',
          customerPhone: '+251-989-1256',
          pickupDate: DateTime.now(),
          pickupLocation: 'Gerji, Bole Sub City',
          dropLocation: 'Kolfe, Helen bldg.',
          truckCategory: 'Medium Truck',
          truckSubCategory: '5 Ton',
          recieverName: 'Muluken T',
          revieverPhone: '+251-912-459-098',
          quoteDate: DateTime.now(),
          status: 'Quote Active',
          driverName: 'Habtamu Kebede',
          driverEmail: 'usmanu@gmail.com')
    ],
  )
];
