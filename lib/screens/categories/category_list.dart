// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:truck_booking_admin/providers/categories_dummy.dart';
import 'package:truck_booking_admin/screens/categories/category_add.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/widgets/modal_side_list.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  _createCategory() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateCategory(),
        transitionDuration: const Duration(seconds: 0),
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
          SingleChildScrollView(
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
                    rows: categoryDummy
                        .map<DataRow>(
                          (element) => DataRow(
                            cells: [
                              DataCell(Text(
                                element.name.toString().toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                              )),
                              DataCell(Text(
                                element.description.toString().toUpperCase(),
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
                                          body: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 100),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Center(
                                                  child: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/images/tuck.jpg'),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    radius: 70,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 100,
                                                      vertical: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Center(
                                                        // ignore: prefer_adjacent_string_concatenation
                                                        child: Text('Car/Taxi Name' +
                                                            '                  ' +
                                                            'Medium trucks'),
                                                      ),
                                                      //Text('Medium trucks')
                                                    ],
                                                  ),
                                                ),
                                                // ignore: prefer_const_literals_to_create_immutables
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 100,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      // ignore: prefer_adjacent_string_concatenation
                                                      Text('Weight Details' +
                                                          '                  ' +
                                                          '6'),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 100,
                                                    vertical: 20,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      Text('Description'),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 80.0),
                                                          child: Text(
                                                              'A pickup truck or pickup is a light-duty truck that has an enclosed cabin and an open cargo area with low sides and tailgate. In Australia and New Zealand, both pickups and coupé utilities are called utes, short for utility vehicle.'),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                        // _delete(element);
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      tooltip: 'Delete',
                                      onPressed: () async {
                                        // _delete(element);
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
