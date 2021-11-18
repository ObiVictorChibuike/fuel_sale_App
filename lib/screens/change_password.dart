import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class ChangePasswordSetting extends StatefulWidget {
  const ChangePasswordSetting({Key? key}) : super(key: key);

  @override
  _ChangePasswordSettingState createState() => _ChangePasswordSettingState();
}

class _ChangePasswordSettingState extends State<ChangePasswordSetting> {
  late bool? isSwitchNotificationOn = false;
  late bool? isSwitchSMSOn = false;
  late bool? isSwitchUpdatePromptOn = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[AppTheme.gradientBlue1, AppTheme.gradientBlue2],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppTheme.white,
                        )),
                    SizedBox(
                      width: 80,
                    ),
                    Container(
                        child: Text(
                      'Notifications',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: "Nunito",
                          color: AppTheme.white),
                    )),
                  ],
                ),
              ],
            )),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 28.0, right: 28, top: 58, bottom: 58),
        child: Card(
          elevation: 2,
          child: Container(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 26),
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                  ),
                  Text(
                    'Change Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                        color: AppTheme.dark_blue),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  CustomFormField(
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 50,
                      validator: (value) {}),
                  SizedBox(
                    height: 27,
                  ),
                  CustomFormField(
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 50,
                      validator: (value) {}),
                  SizedBox(
                    height: 27,
                  ),
                  CustomFormField(
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 50,
                      validator: (value) {}),
                  SizedBox(
                    height: 127,
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
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
