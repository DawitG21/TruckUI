import 'package:flutter/material.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class DriverDetailPreview extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String email;
  final String phone;
  final String plateNumber;
  final String date;
  final String isActive;

  // ignore: use_key_in_widget_constructors
  const DriverDetailPreview(this.name, this.imageUrl, this.email, this.phone,
      this.plateNumber, this.date, this.isActive);

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
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imageUrl),
                      backgroundColor: Colors.transparent,
                      radius: 70,
                    ),
                  ),
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
                          child: Icon(Icons.email),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(email),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.phone),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(phone),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.car_rental),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(plateNumber),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.calendar_today),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(date),
                        )),
                      ]),
                      TableRow(children: [
                        const TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.playlist_add_check),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(isActive),
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
