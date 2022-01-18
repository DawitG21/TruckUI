import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/driver.dart';
import 'package:truck_booking_admin/providers/driver_provider.dart';
import 'package:truck_booking_admin/screens/drivers/add_driver.dart';
import 'package:truck_booking_admin/screens/drivers/driver_edit.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/driver_detail_preview.dart';

class DriverList extends StatefulWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  _DriverListState createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Driver> drivers = [];
  final String encodedData = Driver.encode([
    Driver(
        id: "ac3c1087-ecec-413f-9fdc-1f7b8ce9f9ops",
        name: "Junta Tefa",
        email: "junta@gmail.com",
        phone: "+251 978990",
        plateNumber: 'A51527',
        isActive: true,
        holdingName: 'Dawit',
        accountNumber: 'ACCu55058tjg',
        bankName: 'Awash Bank',
        ifscCode: 'DG788FFD'),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    //await prefs.setString('driver_key', encodedData);
    final String? driveString = prefs.getString('driver_key');
    setState(() {
      if (driveString != null) {
        drivers = Driver.decode(driveString);
      }
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

  _createDriver() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateDriver(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  _deleteDriver(id) async {
    await Provider.of<DriverProvider>(context, listen: false).deleteDriver(id);
    final SharedPreferences prefs = await _prefs;
    // await prefs.setString('trackui_key', encodedData);
    final String? driveString = prefs.getString('driver_key');
    setState(() {
      if (driveString != null) {
        drivers = Driver.decode(driveString);
      }
    });
    toastMessage('Sucessful');
  }

  _editDriver(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditDriver(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          color: AppTheme.contentTextHeader,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Drivers"),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _createDriver();
                },
                child: const Text('Create Driver'),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 30.0, right: 30.0),
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
                          'Plate Number',
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
                    rows: drivers
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
                                element.phone.toString().toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                element.plateNumber.toString().toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(element.isActive!
                                  ? const Text("Active")
                                  : const Text("Inactive")),
                              DataCell(Row(
                                children: [
                                  const DriverDetailPreview(
                                      'Chala Studio',
                                      'assets/images/driver.png',
                                      'jantakefu@gmail.com',
                                      '+2519129685865',
                                      'A51517',
                                      'Registered on - 2022-01-12',
                                      'Active'),
                                  // IconButton(onPressed: onPressed, icon: icon)
                                  IconButton(
                                    tooltip: 'Edit',
                                    onPressed: () async {
                                      _editDriver(element);
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    tooltip: 'Delete',
                                    onPressed: () async {
                                      _deleteDriver(element.id);
                                    },
                                    icon: const Icon(
                                      Icons.delete_forever,
                                    ),
                                  ),
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
    );
  }
}
