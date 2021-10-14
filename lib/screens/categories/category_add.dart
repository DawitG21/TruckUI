// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/categories/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({Key? key}) : super(key: key);

  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  String defaultPic = 'assets/images/profile.jpg';
  // ignore: prefer_typing_uninitialized_variables
  var _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      // backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
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
                                          const IndexCategory(),
                                      transitionDuration:
                                          const Duration(seconds: 0),
                                    ),
                                  );
                                },
                              ),
                              Text("Categories"),
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
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
                          //     Navigator.pushReplacement(
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
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Category Name',
                hintText: 'e.g Heavy Truck',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Weight',
                  hintText: 'e.g Heavy Truck',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'e.g Detail Information',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
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
                              height: 150.0,
                              width: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: ElevatedButton(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
