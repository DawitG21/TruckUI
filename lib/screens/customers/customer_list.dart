import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/customer.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/detail_preview_widget.dart';
// import 'package:truck_booking_admin/widgets/detail_preview_widget.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

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
      date: "1/4/2022",
      isActive: true,
    ),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('customer_key', encodedData);
    final String? storageKey = prefs.getString('customer_key');
    setState(() {
      customers = Customer.decode(storageKey!);
    });
    super.didChangeDependencies();
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
                    // _createCategory();
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
                                  element.email.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.phone.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.date.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(element.isActive!
                                    ? const Text("Active")
                                    : const Text("Inactive")),
                                DataCell(Row(
                                  children: [
                                    const CustomerDetailPreview(
                                        'Jane Doe Hart',
                                        'assets/images/profile.jpg',
                                        'janedoe@gmail.com',
                                        '+251912908865',
                                        'Bole, Addis Ababa, Ethiopia',
                                        'Registered on - 2021-01-12',
                                        1),
                                    // IconButton(onPressed: onPressed, icon: icon)
                                    IconButton(
                                      tooltip: 'Edit',
                                      onPressed: () async {
                                        // _delete(element);
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      tooltip: 'Delete',
                                      onPressed: () async {
                                        // _delete(element);
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
