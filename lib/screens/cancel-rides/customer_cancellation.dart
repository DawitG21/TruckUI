import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/cancel_ride.dart';
import 'package:truck_booking_admin/models/quotation.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/customer_rides_detail.dart';

class CustomerCancellationList extends StatefulWidget {
  const CustomerCancellationList({Key? key}) : super(key: key);

  @override
  _CustomerCancellationListState createState() =>
      _CustomerCancellationListState();
}

class _CustomerCancellationListState extends State<CustomerCancellationList> {
  List<CancelRides> cancelRidesNew = [];

  final List<CancelRides> cancelRidesEncoded = ([
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
  ]);

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
                        const Text("Customer Cancellation Rides"),
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
                                    'Number of Cancel Bookings',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(label: Text('')),
                              ],
                              rows: cancelRidesEncoded
                                  .map<DataRow>(
                                    (element) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          element.quotations![0].customerName
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.quotations![0].customerEmail
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.quotations![0].customerPhone
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.totalBookings.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Row(
                                          children: [
                                            CustomerRidesPreview(
                                              element.cancelReason!,
                                              element.cancelType!,
                                              element.cancelPenalty!.toDouble(),
                                              element.totalBookings!,
                                              element.quotations!,
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
