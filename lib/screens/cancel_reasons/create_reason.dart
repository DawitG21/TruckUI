// ignore_for_file: use_key_in_widget_ructors, prefer__ructors, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new, constant_identifier_names, prefer_final_fields, avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:truck_booking_admin/models/cancel_reasons.dart';
import 'package:provider/provider.dart';
import 'package:truck_booking_admin/providers/cancel_reasons_provider.dart';
import 'package:truck_booking_admin/providers/menu_controller.dart';
import 'package:truck_booking_admin/providers/toast_provider.dart';
import 'package:truck_booking_admin/screens/cancel_reasons/index.dart';
import 'package:truck_booking_admin/utilities/app_theme.dart';
import 'package:truck_booking_admin/utilities/sidebar.dart';

enum TrueFalse { True, False }

class CreateReason extends StatefulWidget {
  @override
  _CreateReasonState createState() => _CreateReasonState();
}

class _CreateReasonState extends State<CreateReason> {
  TextEditingController reasonType = TextEditingController();
  TextEditingController reasonFor = TextEditingController();
  TextEditingController reason_ = TextEditingController();
  TextEditingController cancellationType = TextEditingController();
  late GlobalKey<FormState> _formKeyCancelReason;
  TrueFalse _optionCancelType = TrueFalse.False;

  @override
  void initState() {
    super.initState();
    _formKeyCancelReason = GlobalKey();
  }

  @override
  void dispose() {
    reasonType.dispose();
    reasonFor.dispose();
    reason_.dispose();
    cancellationType.dispose();
    super.dispose();
  }

  _back() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => CancelReasonsIndex(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  create() async {
    if (_formKeyCancelReason.currentState!.validate()) {
      CancelReasons reason = CancelReasons(
        id: DateTime.now().toString(),
        reasonType: reasonType.text,
        reasonFor: reasonFor.text,
        reason: reason_.text,
        cancelType: cancellationType.text as bool,
      );
      await Provider.of<CancelProvider>(context, listen: false)
          .addReason(reason);
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
      key: _formKeyCancelReason,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createReasonHeader,
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
                      items: cancelType,
                      itemAsString: (c) => c.name.toUpperCase(),
                      maxHeight: 250,
                      dialogMaxWidth: 200,
                      showSelectedItem: false,
                      showClearButton: true,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null
                          ? "Cancellation type is required "
                          : null,
                      label: "Cancellation Type *",
                      onChanged: (value) {
                        reasonType.text = value.name;
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
                    child: DropdownSearch<dynamic>(
                      items: cancelledFor,
                      itemAsString: (c) => c.name.toUpperCase(),
                      maxHeight: 250,
                      dialogMaxWidth: 200,
                      showSelectedItem: false,
                      showClearButton: true,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value == null ? "Cancelled For is required " : null,
                      label: "Cancellation For *",
                      onChanged: (value) {
                        reasonType.text = value.name;
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
                      controller: reason_,
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Reason',
                        hintText: 'e.g Enter Reason Here',
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
                      child: Text('Cancellation Type'),
                    ),
                    for (var option in TrueFalse.values)
                      ListTile(
                        title: option.index == 0
                            ? Text('Chargeable')
                            : Text('Free'),
                        leading: Radio(
                          value: option,
                          activeColor: Colors.black,
                          groupValue: _optionCancelType,
                          onChanged: (TrueFalse? value) {
                            setState(() {
                              _optionCancelType = value!;
                              option.index == 0
                                  ? cancellationType.text = true.toString()
                                  : cancellationType.text = false.toString();
                              print('charged: ' + cancellationType.text);
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

  Widget get _createReasonHeader {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          InkWell(
            child: navigationIcon(
              icon: Icons.arrow_left,
              title: Text(
                'Create Reason'.toUpperCase(),
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
                  onTap: create,
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
