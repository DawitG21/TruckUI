import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truck_booking_admin/models/quotation.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class DriverRidesPreview extends StatelessWidget {
  final String cancelReason;
  final String cancelType;
  final int totalBookings;
  final List<Quotation> quotations;

// ignore: use_key_in_widget_constructors
  const DriverRidesPreview(
    this.cancelReason,
    this.cancelType,
    this.totalBookings,
    this.quotations,
  );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'View',
      onPressed: () async {
        showModalSideSheet(
          context: context,
          width: 600,
          ignoreAppBar: false,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 100),
              child: Column(
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user_pic.png'),
                      backgroundColor: Colors.transparent,
                      radius: 60,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      quotations[0].driverName!,
                      style: const TextStyle(
                        fontSize: 25,
                        wordSpacing: 7,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      quotations[0].driverEmail!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      quotations[0].driverPhone!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Divider(),
                  for (Quotation item in quotations)
                    ExpansionTile(
                      title: Text(item.quotationId!),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Center(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/user_pic.png'),
                                    backgroundColor: Colors.transparent,
                                    radius: 30,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(item.driverName!),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text('Driver'),
                              ],
                            ),
                            Table(
                              columnWidths: const {
                                0: IntrinsicColumnWidth(),
                                1: IntrinsicColumnWidth(),
                                2: IntrinsicColumnWidth(),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.event_busy),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cancel Reason - '),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(cancelReason),
                                  )),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.cancel_schedule_send),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Cancel Type - '),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(cancelType),
                                  )),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.local_shipping),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Truck Category'),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item.truckCategory!),
                                  )),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.airport_shuttle),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Truck Sub-Category - '),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item.truckSubCategory!),
                                  )),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.request_quote),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Quotation Id'),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item.quotationId!),
                                  )),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.calendar_today),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Pickup Date'),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(DateFormat("yyyy-MM-dd")
                                        .format(item.pickupDate!)),
                                  )),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.location_on),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Pickup Location'),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item.pickupLocation!),
                                  )),
                                ]),
                                TableRow(children: [
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.pin_drop),
                                  )),
                                  const TableCell(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Drop Location'),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item.dropLocation!),
                                  )),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.visibility,
      ),
    );
  }
}
