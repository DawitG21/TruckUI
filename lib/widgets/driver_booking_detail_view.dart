import 'package:flutter/material.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class DriverBookingPreview extends StatelessWidget {
  final String quotaionId;
  final String date;
  final String orderStatus;
  final int totalFare;

  // ignore: use_key_in_widget_constructors
  const DriverBookingPreview(
      this.quotaionId, this.date, this.orderStatus, this.totalFare);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'View',
      onPressed: () async {
        showModalSideSheet(
          context: context,
          width: 500,
          ignoreAppBar: false,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 100),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Center(
                    child: Text(
                      quotaionId.toUpperCase(),
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth()
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.bookmark_border),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(quotaionId),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.pending_actions),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Total Fare -' + totalFare.toString()),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.location_on_outlined),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(orderStatus),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.bookmark_added_outlined),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(date),
                        )),
                      ]),
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
