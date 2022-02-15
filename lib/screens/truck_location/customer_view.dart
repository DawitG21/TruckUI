import 'package:flutter/material.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
//rimport 'package:truck_booking_admin/screens/truck_location/index_map_view.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
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
                        const Text("Customer Map View"),
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

                        //   const TextField(),
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
                                    'Sl No.',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Customer Name',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Customer Mobile',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Customer Status',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(label: Text('')),
                              ],
                              rows: const [],
                              // rows: [], cancelRidesEncoded
                              //     .map<DataRow>(
                              //       (element) => DataRow(
                              //         cells: [
                              //           DataCell(Text(
                              //             element.quotations![0].customerName
                              //                 .toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Text(
                              //             element.quotations![0].customerEmail
                              //                 .toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Text(
                              //             element.quotations![0].customerPhone
                              //                 .toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Text(
                              //             element.totalBookings.toString(),
                              //             overflow: TextOverflow.ellipsis,
                              //           )),
                              //           DataCell(Row(
                              //             children: [
                              //               CustomerRidesPreview(
                              //                 element.cancelReason!,
                              //                 element.cancelType!,
                              //                 element.cancelPenalty!.toDouble(),
                              //                 element.totalBookings!,
                              //                 element.quotations!,
                              //               ),
                              //               // IconButton(onPressed: onPressed, icon: icon)
                              //             ],
                              //           )),
                              //         ],
                              //       ),
                              //     )
                              //     .toList(),
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
                        const Text("Showing 0 out of 0 Results"),
                        const Text(
                          "Next Page",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    padding: const EdgeInsets.all(25),
                    width: 400.0,
                    child: Column(
                      children: const [
                        //Text('Search The Location'),

                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Search The Location Here',
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: const [
                          Text(
                            "No of Free Customers : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "O Customers ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "No of Occupied  Customers : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'O Customers ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
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
