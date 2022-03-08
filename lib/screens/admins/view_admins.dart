// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/admins.dart';
import 'package:truck_booking_admin/models/permissions.dart';
import 'package:truck_booking_admin/providers/admin_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/admins/add_admins.dart';
import 'package:truck_booking_admin/screens/admins/edit_admins.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/admin_detail_preview.dart';

class ViewAdminsList extends StatefulWidget {
  const ViewAdminsList({Key? key}) : super(key: key);

  @override
  _ViewAdminsListState createState() => _ViewAdminsListState();
}

class _ViewAdminsListState extends State<ViewAdminsList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Admin> viewAdmins = [];
  final List<Admin> viewAdminPermissions = ([
    Admin(
      id: 'tutu-jgjjr8-67u8u-uy85i9-ii587',
      firstName: 'Chala',
      lastName: 'Studio',
      email: 'chal@gmail.com',
      phone: '+2519-858-484',
      address: 'Addis Ababa',
      permissions: [
        Permission(
          id: 'P-8484-4748',
          permissionName: 'Add City',
        ),
        Permission(
          id: 'P-758-5758',
          permissionName: 'View Truck Category',
        ),
      ],
    ),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('admin_key', viewAdminPermissions.toString());
    final String? adminString = prefs.getString('admin_key');
    setState(() {
      if (adminString != null) {
        viewAdmins = Admin.decode(adminString);
      }
    });
    super.didChangeDependencies();
  }

  _createAdmins() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateAdmins(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  _deleteAdmin(id) async {
    await Provider.of<AdminProvider>(context, listen: false).deleteadmin(id);
    final SharedPreferences prefs = await _prefs;
    // await prefs.setString('trackui_key', encodedData);
    final String? adminString = prefs.getString('admin_key');
    setState(() {
      if (adminString != null) {
        viewAdmins = Admin.decode(adminString);
      }
    });
    toastMessage('Sucessful');
  }

  _editAdmin(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditAdmins(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
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
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("View Admins"),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            _createAdmins();
                          },
                          child: const Text('Create Admins'),
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
                                    'Admin Name',
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
                                  '',
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                              rows: viewAdminPermissions
                                  .map<DataRow>(
                                    (element) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          element.firstName.toString(),
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
                                        DataCell(
                                          Row(
                                            children: [
                                              AdminsDetailPreview(
                                                element.firstName!,
                                                element.lastName!,
                                                element.email!,
                                                element.phone!,
                                                element.address!,
                                              ),
                                              // IconButton(onPressed: onPressed, icon: icon)
                                              IconButton(
                                                tooltip: 'Edit',
                                                onPressed: () async {
                                                  _editAdmin(element);
                                                },
                                                icon: const Icon(Icons.edit),
                                              ),
                                              IconButton(
                                                tooltip: 'Delete',
                                                onPressed: () async {
                                                  _deleteAdmin(element.id);
                                                },
                                                icon: const Icon(
                                                  Icons.delete_forever,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                        const Text("Showing 6 out of 6 Results"),
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
