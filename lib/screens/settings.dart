import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/account.dart';
import 'package:fuel_sale_app/screens/change_password.dart';
import 'package:fuel_sale_app/screens/toggle_notification.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
                          'Setting',
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
        body: Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 75,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, AccountSettings());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.supervisor_account_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dark_blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, ChangePasswordSetting());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.security_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Security',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dark_blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, ToggleNotification());
                },
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        size: 20,
                        color: AppTheme.dark_blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dark_blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
