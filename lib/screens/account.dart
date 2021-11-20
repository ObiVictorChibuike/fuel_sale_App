import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

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
                  colors: <Color>[
                    AppTheme.gradientBlue1,
                    AppTheme.gradientBlue2
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {Navigator.of(context).pop();},
                          icon: Icon(Icons.arrow_back_ios, color: AppTheme.white,)),
                      SizedBox(width: 100,),
                      Container(
                          child: Text('Account', textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Nunito", color: AppTheme.white),
                      )),
                    ],
                  ),
                ],
              )),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 58.0, bottom: 80, left: 31, right: 31),
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
                        border: Border.all(color: AppTheme.blue, width: 5.0),
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
                      shadowColor: AppTheme.backGround,
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 50,
                      initialValue: 'James Chukwu',
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    CustomReadOnlyFormField(
                      shadowColor: AppTheme.backGround,
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 50,
                      initialValue: 'JayVictor999@gmail.com',
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    CustomReadOnlyFormField(
                      shadowColor: AppTheme.backGround,
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 50,
                      initialValue: '07045367876',
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    CustomReadOnlyFormField(
                      shadowColor: AppTheme.backGround,
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 50,
                      initialValue: 'German,English',
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
