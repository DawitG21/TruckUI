// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/city.dart';
import 'package:truck_booking_admin/providers/city_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/City/add_city.dart';
import 'package:truck_booking_admin/screens/City/city_list.dart';
//import 'package:truck_booking_admin/screens/City/index.dart';


import 'package:truck_booking_admin/screens/city/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class EditCity extends StatefulWidget {
  const EditCity({Key? key}) : super(key: key);

  @override
  _EditCityState createState() => _EditCityState();
}

class _EditCityState extends State<EditCity> {
  String id = '';
  TextEditingController cityName = TextEditingController();
  TextEditingController radius = TextEditingController();
  // ignore: prefer_final_fields
  String _id = '';

  // save() async {
  //   City city = City(
  //     id: id,
  //     name: name.text,
  //     radius: double.parse(radius.text),
  //   );
  //   await Provider.of<CityProvider>(context, listen: false).editCity(city);
  //   toastMessage('Sucessful');
  // }

  // toastMessage(msg) {
  //   Fluttertoast.showToast(
  //     msg: "$msg",
  //     timeInSecForIosWeb: 5,
  //     webShowClose: true,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }

  save() async {
    City city = City(
      id: _id,
      name: cityName.text,
      radius: double.parse(radius.text),

      // phone: phone.text,
      // address: address.text,
      // isActive: _isActive,
      // date: _date,
    );
    await Provider.of<CityProvider>(context, listen: false)
        .editCity(city);
    toastMessage('Sucessful');
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
  void didChangeDependencies() {
    final City city = ModalRoute.of(context)!.settings.arguments as City;
    id = city.id.toString();
    cityName.text = city.name.toString();
    radius.text = city.radius.toString();
    //how? bool to string
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      // backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Sidebar(),
              ),

              /// Main Body Part
              Expanded(
                flex: 4,
                child: Container(
                  //margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.contentBackgroundColor,
                    //borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(15),
                        color: AppTheme.contentTextHeader,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  child: Icon(Icons.arrow_back_ios),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const IndexCity(),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ),
                                    );
                                  },
                                ),
                                Text("Create City"),
                              ],
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () {
                                save();
                                //_createCategory();
                              },
                              child: const Text('Save'),
                            ),
                            // TextButton(
                            //   style: ButtonStyle(
                            //     foregroundColor:
                            //         MaterialStateProperty.all<Color>(
                            //             Colors.blue),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.pushReplacement(
                            //       context,
                            //       PageRouteBuilder(
                            //         pageBuilder: (_, __, ___) =>
                            //             const IndexCity(),
                            //         transitionDuration:
                            //             const Duration(seconds: 0),
                            //       ),
                            //     );
                            //   },
                            //   child: const Text('Back'),
                            // ),
                          ],
                        ),
                      ),

                      //City(),
                      const Divider(),
                      _buildForm,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildForm {
    return Expanded(
      child: Form(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cityName,
                      decoration: InputDecoration(
                        labelText: 'City Name',
                        hintText: 'e.g Addis Ababa',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: radius,
                      decoration: InputDecoration(
                        labelText: 'Radius ',
                        hintText: 'e.g 1212.1223',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
