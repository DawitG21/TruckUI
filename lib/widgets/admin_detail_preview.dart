import 'package:flutter/material.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class AdminsDetailPreview extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  // ignore: use_key_in_widget_constructors
  const AdminsDetailPreview(
      this.firstName, this.lastName, this.email, this.phone, this.address);

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
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user_pic.png'),
                      backgroundColor: Colors.transparent,
                      radius: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),
                  Center(
                    child: Text(
                      firstName,
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
                          child: Icon(Icons.badge),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(firstName + ' ' + lastName),
                        )),
                      ]),
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
                          child: Icon(Icons.category),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(address),
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
