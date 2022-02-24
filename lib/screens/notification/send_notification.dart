// ignore_for_file: use_key_in_widget_ructors, prefer__ructors, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new, constant_identifier_names, prefer_final_fields, avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/models/notification.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/providers/notifications_provider.dart';
import 'package:truck_booking_admin/providers/toast_provider.dart';
import 'package:truck_booking_admin/screens/notification/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

enum TrueFalse { True, False }

class SendNotification extends StatefulWidget {
  @override
  _SendNotificationState createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {
  TextEditingController type = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController messages = TextEditingController();
  TextEditingController customer = TextEditingController();
  late GlobalKey<FormState> _formKeySendMessage;
  TrueFalse _optionCancelType = TrueFalse.False;

  @override
  void initState() {
    super.initState();
    _formKeySendMessage = GlobalKey();
  }

  @override
  void dispose() {
    type.dispose();
    subject.dispose();
    messages.dispose();
    customer.dispose();
    super.dispose();
  }

  _back() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => NotificationIndex(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  send() async {
    if (_formKeySendMessage.currentState!.validate()) {
      Notifications message = Notifications(
        id: DateTime.now().toString(),
        type: type.text as bool,
        subject: subject.text,
        message: messages.text,
        createdAt: DateTime.now(),
      );
      await Provider.of<NotificationProvider>(context, listen: false)
          .sendNotification(message);
      toastMessage('Sucess');
    } else {
      toastMessage('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppTheme.contentBackgroundColor,
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
                decoration: BoxDecoration(
                    //color: AppColor.bgContainer,
                    //color: AppTheme.contentBackgroundColor,
                    ),
                child: _buildForm,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildForm {
    return Form(
      key: _formKeySendMessage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _editUnitHeader,
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 15.0),
            child: Text('Mandatory fields are marked with (*)'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: DropdownSearch<dynamic>(
                      items: customers,
                      itemAsString: (c) => c.name.toUpperCase(),
                      maxHeight: 250,
                      dialogMaxWidth: 200,
                      showSelectedItem: false,
                      showClearButton: true,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value == null ? "Customer is required " : null,
                      label: "Customers *",
                      onChanged: (value) {
                        customer.text = value.name;
                      },
                      showSearchBox: true,
                      dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: subject,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: 2,
                      validator: (value) =>
                          value == null ? "Subject is required " : null,
                      decoration: InputDecoration(
                        labelText: 'Subject *',
                        hintText: 'e.g Holiday Offers',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: messages,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: 5,
                      validator: (value) =>
                          value == null ? "Message is required " : null,
                      decoration: InputDecoration(
                        labelText: 'Message *',
                        hintText: 'e.g Enter Message Here',
                        alignLabelWithHint: true,
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 45.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 5, right: 15.0),
                      child: Text('Send To'),
                    ),
                    for (var option in TrueFalse.values)
                      ListTile(
                        title: option.index == 0
                            ? Text('Customers')
                            : Text('Drivers'),
                        leading: Radio(
                          value: option,
                          activeColor: Colors.black,
                          groupValue: _optionCancelType,
                          onChanged: (TrueFalse? value) {
                            setState(() {
                              _optionCancelType = value!;
                              option.index == 0
                                  ? type.text = true.toString()
                                  : type.text = false.toString();
                              print('sendTo: ' + type.text);
                            });
                          },
                        ),
                      )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _editUnitHeader {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          InkWell(
            child: navigationIcon(
              icon: Icons.arrow_left,
              title: Text(
                'Send Notification'.toUpperCase(),
              ),
            ),
            onTap: _back,
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  child: navigationIcon(
                    icon: Icons.cancel,
                    title: Text(
                      'Cancel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: _back,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  child: navigationIcon(
                    icon: Icons.save,
                    title: Text(
                      'Save',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: send,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget navigationIcon({icon, title}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.red,
          ),
        ),
        Container(
          child: title,
        )
      ],
    );
  }
}
