// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/city.dart';
import 'package:truck_booking_admin/screens/City/add_city.dart';
import 'package:truck_booking_admin/screens/City/edit_city.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/city_preview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:truck_booking_admin/providers/city_provider.dart';

// import 'package:truck_booking_admin/widgets/city_preview.dart';
// ignore: unused_import
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class CityList extends StatefulWidget {
  const CityList({Key? key}) : super(key: key);

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<City> cities = [];
  final String encodedData = City.encode([
    City(
      id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99ops",
      name: "Welega",
      weight: 10.5,
      radius: 70.0,
      latitude: 77.2217831,
      longtude: 78.2217831,
      date: "1/4/2022",
    ),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('city_key', encodedData);
    final String? storageKey = prefs.getString('city_key');
    setState(() {
      cities = City.decode(storageKey!);
      //print(cities);
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

  _createCity() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateCity(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  _editCity(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditCity(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
  }

  _deleteCity(id) async {
    await Provider.of<CityProvider>(context, listen: false).deleteCity(id);
    final SharedPreferences prefs = await _prefs;
    final String? cusString = prefs.getString('city_key');
    setState(() {
      if (cusString != null) {
        cities = City.decode(cusString);
      }
    });
    toastMessage('Sucessful');
  }

  toastMessages(msg) {
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
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: AppTheme.contentTextHeader,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Cities"),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    _createCity();
                  },
                  child: const Text('Create City'),
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
                            'City Name',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Weight',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Radius',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Latitude',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Longtude',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                            label: Text(
                          'Date',
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataColumn(
                            label: Text(
                          '',
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                      rows: cities
                          .map<DataRow>(
                            (element) => DataRow(
                              cells: [
                                DataCell(Text(
                                  element.name.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.weight.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.radius.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.latitude.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.longtude.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.date.toString(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Row(
                                  children: [
                                    const CityDetailPreview(
                                      'Welega',
                                      //  50,
                                      102.121,
                                      12221.122,
                                      // 100,
                                      // 'Registered on - 2021-01-12',
                                    ),
                                    //IconButton(onPressed: Cit, icon:const Icon(Icons.visibility),),
                                    IconButton(
                                      tooltip: 'Edit',
                                      onPressed: () async {
                                        // _editCity;
                                        _editCity(element);
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      tooltip: 'Delete',
                                      onPressed: () async {
                                        _deleteCity(element);
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
    );
  }
}
