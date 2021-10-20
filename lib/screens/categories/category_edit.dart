// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/category.dart';
import 'package:truck_booking_admin/providers/category_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/screens/categories/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditCategory extends StatefulWidget {
  static const routeName = '/category_edit';
  const EditCategory({Key? key}) : super(key: key);

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  String defaultPic = 'assets/images/profile.jpg';
  String id = '';
  TextEditingController name = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController description = TextEditingController();

  save() async {
    Category category = Category(
      id: id,
      name: name.text,
      description: description.text,
      weight: weight.text,
    );
    await Provider.of<CategoryProvider>(context, listen: false)
        .editCategory(category);
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
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;
    name.text = category.name.toString();
    description.text = category.description.toString();
    weight.text = category.weight;
    id = category.id.toString();

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
                              save();
                              //_EditCategory();
                            },
                            child: const Text('Save'),
                          ),
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
    );
  }

  Widget get _buildForm {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: name,
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
                controller: weight,
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
                controller: description,
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
