// Flutter imports:
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/cancel_reasons.dart';

// Package imports:
import 'package:truck_booking_admin/providers/cancel_reasons_provider.dart';
import 'package:truck_booking_admin/providers/toast_provider.dart';
import 'package:truck_booking_admin/screens/cancel_reasons/edit_reason.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/cancel_reasons_preview.dart';

class CancelReasonTable extends StatefulWidget {
  @override
  _CancelReasonTableState createState() => _CancelReasonTableState();
}

class _CancelReasonTableState extends State<CancelReasonTable> {
  bool tappedYes = false;
  bool isInit = true;
  bool _isLoading = false;
  List<CancelReasons> reasons = [];
  TextEditingController searchController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        _isLoading = false;
      });
      isInit = false;
    }
    super.didChangeDependencies();
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
        reasons = cusString as List<CancelReasons>;
      }
    });
    toastMessage('Sucessful');
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              // _searchNotifications,
              Container(
                height: MediaQuery.of(context).size.height / 1.45,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          );
  }
}
