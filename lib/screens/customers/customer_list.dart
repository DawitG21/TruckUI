import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/customer.dart';
import 'package:truck_booking_admin/providers/customer_provider.dart';
import 'package:truck_booking_admin/screens/customers/customer_add.dart';
import 'package:truck_booking_admin/screens/customers/customer_edit.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/detail_preview_widget.dart';
import 'package:intl/intl.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Customer> customers = [];
  final String encodedData = Customer.encode([
    Customer(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "Jane Doe",
      email: "janedoe@gmail.com",
      phone: "+251 912 6789",
      date: DateTime.now(),
      isActive: true,
      address: "Addis Ababa, Ethiopia",
    ),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    // await prefs.setString('customer_key', encodedData);
    final String? storageKey = prefs.getString('customer_key');
    setState(() {
      customers = Customer.decode(storageKey!);
    });
    super.didChangeDependencies();
  }

  _createCustomer() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CustomerAdd(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  _editCustomers(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CustomerEdit(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
  }

  _deleteCustomer(id) async {
    await Provider.of<CustomerProvider>(context, listen: false)
        .deleteCustomer(id);
    final SharedPreferences prefs = await _prefs;
    final String? cusString = prefs.getString('customer_key');
    setState(() {
      if (cusString != null) {
        customers = Customer.decode(cusString);
      }
    });
    toastMessage('Sucessful');
  }

  toastMessage(msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      timeInSecForIosWeb: 5,
      webShowClose: true,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: AppTheme.contentTextHeader,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Customers"),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    _createCustomer();
                  },
                  child: const Text('Create Customer'),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 30.0, right: 30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Text(
                            'Name',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Email',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Phone',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Registered Date',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Status',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(label: Text('')),
                      ],
                      rows: customers
                          .map<DataRow>(
                            (element) => DataRow(
                              cells: [
                                DataCell(Text(
                                  element.name.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.email.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.phone.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  DateFormat("yyyy-MM-dd")
                                      .format(element.date!),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(element.isActive!
                                    ? const Text("Active")
                                    : const Text("Inactive")),
                                DataCell(Row(
                                  children: [
                                    CustomerDetailPreview(
                                        element.name!,
                                        'assets/images/profile.jpg',
                                        element.email!,
                                        element.phone!,
                                        element.address!,
                                        'Registered on - ' +
                                            DateFormat("yyyy-MM-dd")
                                                .format(element.date!),
                                        1),
                                    // IconButton(onPressed: onPressed, icon: icon)
                                    IconButton(
                                      tooltip: 'Edit',
                                      onPressed: () async {
                                        _editCustomers(element);
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      tooltip: 'Delete',
                                      onPressed: () async {
                                        _deleteCustomer(element.id);
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("Showing 4 out of 4 Results"),
                const Text(
                  "Next Page",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
