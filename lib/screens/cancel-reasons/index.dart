// ignore_for_file: use_key_in_widget_ructors, prefer__literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/providers/cancel_reasons_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/providers/toast_provider.dart';
import 'package:truck_booking_admin/screens/cancel-reasons/create_reason.dart';
import 'package:truck_booking_admin/screens/cancel-reasons/edit_reason.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:truck_booking_admin/widgets/cancel_reasons_preview.dart';

class CancelReasonsIndex extends StatefulWidget {
  @override
  _CancelReasonsIndexState createState() => _CancelReasonsIndexState();
}

class _CancelReasonsIndexState extends State<CancelReasonsIndex> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<CancelReasonsIndex> reasons = [];

  _createReason() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => CreateReason(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  _editReason(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditReason(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
  }

  _deactivateReason(id) async {
    await Provider.of<CancelProvider>(context, listen: false)
        .deactivateReason(id);
    final SharedPreferences prefs = await _prefs;
    final String? cusString = prefs.getString('reason_key');
    setState(() {
      if (cusString != null) {
        reasons = cusString as List<CancelReasonsIndex>;
      }
    });
    toastMessage('Sucessful');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppTheme.contentBackgroundColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Sidebar(),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  color: AppTheme.contentTextHeader,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cancel Reasons",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          _createReason();
                        },
                        child: Text('Create Reason'),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text(
                                'Reason Type'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Reason For'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Reason'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Cancel Price'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Cancel Duration'.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataColumn(label: Text('')),
                          ],
                          rows: cancelReasons
                              .map<DataRow>(
                                (element) => DataRow(
                                  cells: [
                                    DataCell(Text(
                                      element.reasonType.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    DataCell(Text(
                                      element.reasonFor.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    DataCell(Text(
                                      element.reason.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    DataCell(Text(
                                      element.cancelPrice.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    DataCell(Text(
                                      element.cancelDuration.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    DataCell(Row(
                                      children: [
                                        CancelReasonsPreview(
                                          element.reasonType!,
                                          element.reasonFor!,
                                          element.reason!,
                                          element.cancelPrice!,
                                          element.cancelDuration!,
                                        ),
                                        IconButton(
                                          tooltip: 'Update',
                                          onPressed: () async {
                                            _editReason(element);
                                          },
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          tooltip: 'Deactivate',
                                          onPressed: () async {
                                            _deactivateReason(element);
                                          },
                                          icon: Icon(
                                            Icons.thumb_down,
                                            color: AppColor.closeIcon,
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Showing 2 out of 2 Results"),
                      Text(
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
    );
  }
}
