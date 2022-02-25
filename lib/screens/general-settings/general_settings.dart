import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/general_settings.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/general-settings/settings_edit.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class GeneralSettingsIndex extends StatefulWidget {
  const GeneralSettingsIndex({Key? key}) : super(key: key);

  @override
  _GeneralSettingsIndexState createState() => _GeneralSettingsIndexState();
}

class _GeneralSettingsIndexState extends State<GeneralSettingsIndex> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<GeneralSettings> settings = [];
  final String encodedData = GeneralSettings.encode([
    GeneralSettings(
        id: 'ac3c1087-ecec12333-413f-9fd',
        settingName: 'Tax',
        description: 'Tax rate to be applied',
        value: '15'),
    GeneralSettings(
        id: 'ac3c1087-ecec12333-413f55789-9fd',
        settingName: 'Hot Line',
        description: 'Call center number',
        value: '8888'),
  ]);

  _editSetting(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const GeneralSettingsEdit(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
  }

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('settings_key', encodedData);
    final String? storageKey = prefs.getString('settings_key');
    setState(() {
      if (storageKey != null) {
        settings = GeneralSettings.decode(storageKey);
      }
    });
    super.didChangeDependencies();
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
                      children: const [
                        Text("General Settings"),
                        // TextButton(
                        //   style: ButtonStyle(
                        //     foregroundColor:
                        //         MaterialStateProperty.all<Color>(Colors.blue),
                        //   ),
                        //   onPressed: _createCoupon,
                        //   child: const Text('Create Coupon'),
                        // ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 30.0,
                      right: 30.0,
                    ),
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
                                    'Setting Name',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Value',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Description',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // DataColumn(
                                //   label: Text(
                                //     'End Date',
                                //     overflow: TextOverflow.ellipsis,
                                //   ),
                                // ),
                                DataColumn(
                                    label: Text(
                                  '',
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ],
                              rows: settings
                                  .map<DataRow>(
                                    (element) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                          element.settingName,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.value,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        DataCell(Text(
                                          element.description,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        // DataCell(Text(
                                        //   DateFormat("yyyy-MM-dd")
                                        //       .format(element.endDate!),
                                        //   overflow: TextOverflow.ellipsis,
                                        // )),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                tooltip: 'Edit',
                                                onPressed: () async {
                                                  _editSetting(element);
                                                },
                                                icon: const Icon(Icons.edit),
                                              ),
                                              // IconButton(
                                              //   tooltip: 'Delete',
                                              //   onPressed: () async {
                                              //     _deleteCoupon(element.id);
                                              //   },
                                              //   icon: const Icon(
                                              //     Icons.delete_forever,
                                              //   ),
                                              // ),
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
