import 'package:flutter/material.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class CityDetailPreview extends StatelessWidget {
  final String name;
  // final double weight;
  final double radius;
  final double latitude;
  // final double longtude;
  // final String date;
  //final int numberofBookings;

  // ignore: use_key_in_widget_constructors
  const CityDetailPreview(
    this.name,
    // this.weight,
    this.radius,
    this.latitude,
    // this.longtude,
    // this.date,
  );

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
                  // Center(
                  //   child: CircleAvatar(
                  //     backgroundImage: AssetImage(imageUrl),
                  //     backgroundColor: Colors.transparent,
                  //     radius: 70,
                  //   ),
                  // ),

                  const Divider(),
                  Center(
                    child: Text(
                      name,
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
                          child: Icon(Icons.location_city),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(name),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.map),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(radius.toString()),
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
                          child: Text(latitude.toString()),
                        )),
                      ]),
                      // TableRow(children: [
                      //   const TableCell(
                      //       child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Icon(Icons.location_on_outlined),
                      //   )),
                      //   TableCell(
                      //       child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(longtude.toString()),
                      //   )),
                      // ]),
                      // TableRow(children: [
                      //   const TableCell(
                      //       child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Icon(Icons.calendar_today),
                      //   )),
                      //   TableCell(
                      //       child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(date),
                      //   )),
                      // ]),
                      // TableRow(children: [
                      //   const TableCell(
                      //       child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Icon(Icons.bookmark_added_outlined),
                      //   )),
                      // ]),
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


