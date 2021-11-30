import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  var _firstName, _lastName, _email, _phoneNumber;

  void initUserData() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    setState(() {
      _firstName = (userdata.getString("firstName"));
      _lastName = (userdata.getString("lastName"));
      _email = (userdata.getString("userEmail"));
      _phoneNumber = (userdata.getString("userPhoneNumber"));
    });
  }

  @override
  void initState() {
    initUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[AppTheme.white, AppTheme.notWhite],
                  ),
                  border: Border(
                    bottom: BorderSide(width: 2, color: AppTheme.dark_blue),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppTheme.dark_blue,
                            )),
                        Spacer(
                          flex: 5,
                        ),
                        Container(
                            child: Text(
                          'Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              fontFamily: "lato",
                              color: AppTheme.dark_blue),
                        )),
                        Spacer(
                          flex: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        body: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
            child: SpinKitCubeGrid(
              color: AppTheme.blue,
              size: 50.0,
            ),
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 58.0, bottom: 80, left: 31, right: 31),
              child: Card(
                elevation: 5,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 39,
                        ),
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppTheme.blue, width: 5.0),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 40.25,
                            backgroundImage: AssetImage('assets/userImage.png'),
                          ),
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        CustomReadOnlyFormField(
                          controller: TextEditingController(text: _firstName),
                          focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                          enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                          backgroundColor: AppTheme.white,
                          height: 45,
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        CustomReadOnlyFormField(
                          controller: TextEditingController(text: _lastName),
                          focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                          enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                          backgroundColor: AppTheme.white,
                          height: 45,
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        CustomReadOnlyFormField(
                          controller: TextEditingController(text: _email),
                          focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                          enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                          backgroundColor: AppTheme.white,
                          height: 45,
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        CustomReadOnlyFormField(
                          controller: TextEditingController(text: _phoneNumber),
                          focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                          enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                          backgroundColor: AppTheme.white,
                          height: 45,
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: CustomButton(
                              decorationColor: AppTheme.dark_blue,
                              buttonHeight: 36,
                              buttonText: 'Save Settings',
                              textColor: AppTheme.white,
                              onPressed: () {}),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
