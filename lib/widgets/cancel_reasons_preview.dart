// ignore_for_file: use_key_in_widget_ructors, prefer__ructors, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class CancelReasonsPreview extends StatelessWidget {
  final String reasonType;
  final String reasonFor;
  final String reason;
  final double cancelPrice;
  final int cancelDuration;

  CancelReasonsPreview(
    this.reasonType,
    this.reasonFor,
    this.reason,
    this.cancelPrice,
    this.cancelDuration,
  );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'View',
      onPressed: () async {
        showModalSideSheet(
          context: context,
          width: 450,
          ignoreAppBar: false,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 100),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Table(
                        columnWidths: {
                          0: IntrinsicColumnWidth(),
                          1: IntrinsicColumnWidth(),
                          2: IntrinsicColumnWidth(),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_right),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Reason Type - '.toUpperCase()),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(reasonType),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_right),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Reason For - '.toUpperCase()),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(reasonFor),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_right),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Reason - '.toUpperCase()),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(reason),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_right),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Cancel Price- '.toUpperCase()),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(cancelPrice.toString()),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_right),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Duration'.toUpperCase()),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(cancelDuration.toString()),
                            )),
                          ]),
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
      icon: Icon(
        Icons.visibility,
      ),
    );
  }
}
