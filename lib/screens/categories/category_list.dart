// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_booking_admin/models/category.dart';
import 'package:truck_booking_admin/providers/category_provider.dart';
import 'package:truck_booking_admin/screens/categories/category_add.dart';
import 'package:truck_booking_admin/screens/categories/category_edit.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/category_view.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Category> categories = [];
  final String encodedData = Category.encode([
    Category(
        id: "ac3c1087-ecec-413f-9fdc-1f7b8ce99dfd",
        name: "Heavy Truck",
        description:
            "a beautiful room fitted with a single bed and breathtaking ocean view.",
        weight: "2"),
  ]);

  @override
  void didChangeDependencies() async {
    final SharedPreferences prefs = await _prefs;
    //await prefs.setString('trackui_key', encodedData);
    final String? catString = prefs.getString('trackui_key');
    setState(() {
      if (catString != null) {
        categories = Category.decode(catString);
      }
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

  _createCategory() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateCategory(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  _deleteCategory(id) async {
    await Provider.of<CategoryProvider>(context, listen: false)
        .deleteCategory(id);
    final SharedPreferences prefs = await _prefs;
    // await prefs.setString('trackui_key', encodedData);
    final String? catString = prefs.getString('trackui_key');
    setState(() {
      if (catString != null) {
        categories = Category.decode(catString);
      }
    });
    toastMessage('Sucessful');
  }

  _editCategory(arg) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditCategory(),
        transitionDuration: const Duration(seconds: 0),
        settings: RouteSettings(arguments: arg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: AppTheme.contentTextHeader,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("Categories"),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    _createCategory();
                  },
                  child: const Text('Create Category'),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 30.0, right: 30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: DataTable(
                      // ignore: prefer_const_literals_to_create_immutables
                      columns: [
                        DataColumn(
                          label: Text(
                            'Name',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Description',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Weight',
                          ),
                        ),
                        DataColumn(label: Text('')),
                      ],
                      rows: categories
                          .map<DataRow>(
                            (element) => DataRow(
                              cells: [
                                DataCell(Text(
                                  element.name!.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(
                                  element.description!.toString().toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                )),
                                DataCell(Text(element.weight.toString())),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        tooltip: 'View',
                                        onPressed: () async {
                                          // _delete(element);
                                          showModalSideSheet(
                                            context: context,
                                            width: 500,
                                            ignoreAppBar: false,
                                            body: CategoryView(
                                              element: element,
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.visibility,
                                        ),
                                      ),
                                      IconButton(
                                        tooltip: 'Edit',
                                        onPressed: () async {
                                          _editCategory(element);
                                        },
                                        icon: Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        tooltip: 'Delete',
                                        onPressed: () async {
                                          _deleteCategory(element.id);
                                        },
                                        icon: Icon(
                                          Icons.delete_forever,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text("Showing 4 out of 4 Results"),
                Text(
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
