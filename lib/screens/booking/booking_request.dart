import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/booking_request.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/booking_request_detail.dart';

class BookingRequestList extends StatefulWidget {
  const BookingRequestList({Key? key}) : super(key: key);

  @override
  _BookingRequestListState createState() => _BookingRequestListState();
}

class _BookingRequestListState extends State<BookingRequestList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<BookingRequest> bookingRequests = [];
  final String encodedData = BookingRequest.encode([
    BookingRequest(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "Dell Doe",
      email: "dell@gmail.com",
      phone: "+251 912 6789",
      category: 'Heavy Weight',
      date: DateTime.now(),
      isActive: true,
    ),
    BookingRequest(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "HP Doe",
      email: "dp@gmail.com",
      phone: "+251 912 65589",
      category: 'Medium Weight',
      date: DateTime.now(),
      isActive: true,
    ),
    BookingRequest(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "Toshiba Doe",
      email: "tosiba@gmail.com",
      phone: "+251 912 8889",
      category: 'Light Weight',
      date: DateTime.now(),
      isActive: false,
    ),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('bookingRequest_key', encodedData);
    final String? storageKey = prefs.getString('bookingRequest_key');
    setState(() {
      bookingRequests = BookingRequest.decode(storageKey!);
    });
    super.didChangeDependencies();
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
                        const Text("Booking Request"),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            //_createBookingRequest();
                          },
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
                                    'Customer Name',
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
                                    'Customer Phone',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Category',
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
                              rows: bookingRequests
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
                                          element.category.toString(),
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
                                            BookingRequestPreview(
                                              element.name!,
                                              element.email!,
                                              element.phone!,
                                              element.category!,
                                              'Registered on - ' +
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(element.date!),
                                              element.isActive!.toString(),
                                            ),
                                            // IconButton(onPressed: onPressed, icon: icon)
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
            ),
          ],
        ),
      ),
    );
  }
}
