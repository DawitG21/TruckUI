import 'package:flutter/material.dart';
import 'package:truck_booking_admin/models/city.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/city_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/City/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateCity extends StatefulWidget {
  const CreateCity({Key? key}) : super(key: key);

  @override
  _CreateCityState createState() => _CreateCityState();
}

class _CreateCityState extends State<CreateCity> {
  TextEditingController cityName = TextEditingController();
  TextEditingController radius = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longtiude = TextEditingController();
  TextEditingController date = TextEditingController();

  // create() async {
  //   City city = City(
  //     id: DateTime.now().toString(),
  //     name: name.text,
  //     radius: double.parse(radius.text),
  //   );
  //   await Provider.of<CityProvider>(context, listen: false).addCity(city);
  //   // if (response) {
  //   toastMessage('Sucessful');
  //   // } else {
  //   //   toastMessage('Fail');
  //   // }
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

  create() async {
    City city = City(
//      id: DateTime.now().toString(),
      name: cityName.text,
      radius: double.parse(radius.text),
      latitude: double.parse(radius.text),
      longtude: double.parse(radius.text),
      date: DateTime.now(),
    );
    await Provider.of<CityProvider>(context, listen: false).addCity(city);

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

  // ignore: prefer_const_constructors
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      // backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
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
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(15),
                            color: AppTheme.contentTextHeader,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      child: const Icon(Icons.arrow_back_ios),
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
                                    const Text("Create City"),
                                  ],
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                  onPressed: () {
                                    create();
                                    //_createCategory();
                                  },
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          ),
                          //City(),
                          // ignore: prefer_const_constructors
                          const Divider(),
                          _buildForm,
                        ],
                      ),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: latitude,
                      decoration: InputDecoration(
                        labelText: 'Latitude ',
                        hintText: 'e.g 1212.1223',
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
                      controller: longtiude,
                      decoration: InputDecoration(
                        labelText: 'Longtiude ',
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
