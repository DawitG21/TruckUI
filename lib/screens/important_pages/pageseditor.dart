// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';


import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

class PagesEditor extends StatefulWidget {
  const PagesEditor({Key? key}) : super(key: key);

  @override
  _PagesEditorState createState() => _PagesEditorState();
}

class _PagesEditorState extends State<PagesEditor> {
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
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Edit Page"),
                      const Divider(),
                      ListView(
                        children: const [
                          Card(
                            child: ListTile(
                              
                              leading: Icon(Icons.edit),
                              title: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Update Page Here'),
                                maxLines: 18,
                              ),
                            ),
                            elevation: 108,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                          ),
                        ],
                        padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                      ),
                      Row(children: [
                TextButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text("SAVE"),
                  onPressed: () {},
                ),
                TextButton.icon(
                  icon: const Icon(Icons.cancel),
                  label: const Text("CANCEL"),
                  onPressed: () {},
                ),
              ],),
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
