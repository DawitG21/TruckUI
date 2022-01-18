// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/driver.dart';
import 'package:truck_booking_admin/providers/driver_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/drivers/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class EditDriver extends StatefulWidget {
  static const routeName = '/driver_edit';
  const EditDriver({Key? key}) : super(key: key);

  @override
  _EditDriverState createState() => _EditDriverState();
}

class _EditDriverState extends State<EditDriver> {
  String defaultPic = 'assets/images/profile.jpg';
  String id = '';
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController plateNumber = TextEditingController();
  TextEditingController truckCategory = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController isActive = TextEditingController();
  TextEditingController holdingName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController ifscCode = TextEditingController();

  save() async {
    Driver driver = Driver(
      id: id,
      name: name.text,
      email: email.text,
      phone: phone.text,
      city: city.text,
      plateNumber: plateNumber.text,
      truckCategory: truckCategory.text,
      isActive: true,
    );
    await Provider.of<DriverProvider>(context, listen: false)
        .editDriver(driver);
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
    final Driver driver = ModalRoute.of(context)!.settings.arguments as Driver;
    id = driver.id.toString();
    name.text = driver.name.toString();
    email.text = driver.email.toString();
    phone.text = driver.phone.toString();
    city.text = driver.city.toString();
    plateNumber.text = driver.plateNumber.toString();
    truckCategory.text = driver.truckCategory.toString();
    isActive.text = driver.isActive.toString(); //how? bool to string
    super.didChangeDependencies();
  }

// ignore: prefer_typing_uninitialized_variables
  var _imageFile;
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
                                            const IndexDrivers(),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ),
                                    );
                                  },
                                ),
                                Text("Create Driver"),
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
                            //         MaterialStateProperty.all<Color>(Colors.blue),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.pushReplacement(k
                            //       context,
                            //       PageRouteBuilder(
                            //         pageBuilder: (_, __, ___) =>
                            //             const IndexCategory(),
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
                      Divider(),
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
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'Driver Name',
                        hintText: 'e.g Dave label',
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
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'Email ',
                        hintText: 'e.g dawit@gmail.com',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'e.g +251967574',
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
                      controller: city,
                      decoration: InputDecoration(
                        labelText: 'City ',
                        hintText: 'e.g Addis Ababa',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: plateNumber,
                      decoration: InputDecoration(
                        labelText: 'Plate Number',
                        hintText: 'e.g B51527',
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
                      controller: truckCategory,
                      decoration: InputDecoration(
                        labelText: 'Truck Category',
                        hintText: 'e.g Heavy Truck',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Account Details', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: holdingName,
                      decoration: InputDecoration(
                        labelText: 'Holding Name',
                        hintText: 'e.g Dave label',
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
                      controller: accountNumber,
                      decoration: InputDecoration(
                        labelText: 'A/c Number ',
                        hintText: 'e.g AC6759',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: bankName,
                      decoration: InputDecoration(
                        labelText: 'Bank Name',
                        hintText: 'e.g Awash Bank',
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
                      controller: ifscCode,
                      decoration: InputDecoration(
                        labelText: 'IFSC Code',
                        hintText: 'e.g IFSC6759',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      child: _imageFile != null
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(_imageFile),
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(15.0),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  defaultPic,
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // chooseImage(ImageSource.gallery);
                      },
                      child: Text('Upload Picture'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        elevation: 3,
                        // ignore: unnecessary_new
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: _imageFile != null
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(_imageFile),
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(15.0),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  defaultPic,
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // chooseImage(ImageSource.gallery);
                      },
                      child: Text('Driving Lisence'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        elevation: 3,
                        // ignore: unnecessary_new
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      child: _imageFile != null
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(_imageFile),
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(15.0),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  defaultPic,
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // chooseImage(ImageSource.gallery);
                      },
                      child: Text('Registration Certificate'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        elevation: 3,
                        // ignore: unnecessary_new
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: _imageFile != null
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(_imageFile),
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(15.0),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  defaultPic,
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // chooseImage(ImageSource.gallery);
                      },
                      child: Text('Insurance'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        elevation: 3,
                        // ignore: unnecessary_new
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
