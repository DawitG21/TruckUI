// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';


import 'package:truck_booking_admin/screens/important_pages/pageseditor.dart';

import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class ListofPages extends StatefulWidget {
  const ListofPages({Key? key}) : super(key: key);

  @override
  _ListofPagesState createState() => _ListofPagesState();
}

class _ListofPagesState extends State<ListofPages> {
  

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
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  padding: const EdgeInsets.all(25),
                  width: 500.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Important Pages"),
                      const Divider(),
                      ListView(
                        children: [
                          
                          Card(
                         
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: TextButton(
                                child: Text("1. Privacy Policy"),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PagesEditor(
                                          //name: _name.text,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: TextButton(
                                child: Text("2. Terms and Condition"),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PagesEditor(
                                          //name: _name.text,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: TextButton(
                                child: Text("3. FAQ"),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PagesEditor(
                                          //name: _name.text,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: TextButton(
                                child: Text("4. Contact Us"),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PagesEditor(
                                          //name: _name.text,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                          ),
                          Card(
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: TextButton(
                                child: Text(
                                  "5. About Us",
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PagesEditor(
                                          //name: _name.text,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                          ),
                        ],
                        padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
