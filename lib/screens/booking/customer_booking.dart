import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/customer_book.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

import 'customer_booking_detail.dart';

class CustomerBookingList extends StatefulWidget {
  const CustomerBookingList({Key? key}) : super(key: key);

  @override
  _CustomerBookingListState createState() => _CustomerBookingListState();
}

class _CustomerBookingListState extends State<CustomerBookingList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<CustomerBooking> customerBookings = [];
  final String encodedData = CustomerBooking.encode([
    CustomerBooking(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "Dawit",
      email: 'dawit@appliedline.com',
      phone: '0957859095',
      bookingNumber: 3,
      totalFare: 3595,
    ),
    CustomerBooking(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "usman",
      email: 'usman@appliedline.com',
      phone: '09575859095',
      bookingNumber: 5,
      totalFare: 6769,
    ),
    CustomerBooking(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "emmon",
      email: 'emmmon@appliedline.com',
      phone: '095739095',
      bookingNumber: 9,
      totalFare: 38484,
    ),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('customerBooking_key', encodedData);
    final String? storageKey = prefs.getString('customerBooking_key');
    setState(() {
      customerBookings = CustomerBooking.decode(storageKey!);
      //print(cities);
    });
    super.didChangeDependencies();
  }

  _customerBooking() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CustomerBookingDetail(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
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
    return Scaffold(
      drawer: const Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppTheme.contentBackgroundColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Sidebar(),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: AppTheme.contentTextHeader,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Customer Booking"),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: null,
                          child: const Text(''),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 30.0, right: 30.0),
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
                                    'Booking Number',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Total Fare',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                    label: Text(
                                  '',
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                              rows: customerBookings
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
                                          element.phone.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.bookingNumber.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.totalFare.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                tooltip: 'View',
                                                onPressed: () async {
                                                  _customerBooking();
                                                },
                                                icon: const Icon(
                                                  Icons.visibility,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                        const Text("Showing 6 out of 6 Results"),
                        const Text(
                          "Next Page",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
