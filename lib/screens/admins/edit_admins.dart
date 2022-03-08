import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/admins.dart';
import 'package:truck_booking_admin/providers/admin_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/admins/view_admins.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class EditAdmins extends StatefulWidget {
  static const routeName = '/admin_edit';
  const EditAdmins({Key? key}) : super(key: key);

  @override
  State<EditAdmins> createState() => _EditAdminsState();
}

class _EditAdminsState extends State<EditAdmins> {
  String defaultPic = 'assets/images/profile.jpg';
  String id = '';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();

  save() async {
    Admin admin = Admin(
        id: id,
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phone: phone.text,
        address: address.text,
        password: password.text);
    await Provider.of<AdminProvider>(context, listen: false).editadmin(admin);
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
    final Admin admin = ModalRoute.of(context)!.settings.arguments as Admin;
    firstName.text = admin.firstName.toString();
    lastName.text = admin.lastName.toString();
    email.text = admin.email.toString();
    phone.text = admin.phone.toString();
    address.text = admin.address.toString();
    password.text = admin.password.toString();
    id = admin.id.toString();

    super.didChangeDependencies();
  }

  // ignore: prefer_typing_uninitialized_variables
  var _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      // backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
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
                                          const ViewAdminsList(),
                                      transitionDuration:
                                          const Duration(seconds: 0),
                                    ),
                                  );
                                },
                              ),
                              const Text("Admins"),
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              save();
                              //_EditCategory();
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    _buildForm,
                  ],
                ),
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
                      controller: firstName,
                      decoration: InputDecoration(
                        labelText: 'Driver First Name',
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
                      controller: lastName,
                      decoration: InputDecoration(
                        labelText: 'Driver Last Name',
                        hintText: 'e.g Dave label',
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
              ],
            ),
            Row(
              children: [
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: MultiSelectBottomSheetField(
                //       initialChildSize: 0.4,
                //       listType: MultiSelectListType.CHIP,
                //       searchable: true,
                //       buttonText: const Text("Permissions List"),
                //       title: const Text("Permissions"),
                //       items: _items,
                //       onConfirm: (values) {
                //         _permissionListArray = values;
                //       },
                //       chipDisplay: MultiSelectChipDisplay(
                //         onTap: (value) {
                //           setState(() {
                //             _permissionListArray.remove(value);
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                  const Text('List of Permissions',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      child: const Text('Upload Picture'),
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
