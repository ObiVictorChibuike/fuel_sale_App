import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(onPressed: () {Navigator.of(context).pop();},
                            icon: Icon(Icons.arrow_back_ios, color: AppTheme.white,)),
                      ),
                      Spacer(flex: 5,),
                      Container(
                          child: Text('Account', textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Nunito", color: AppTheme.white),
                      )),
                      Spacer(flex: 7,),
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
                      controller: TextEditingController(text: "$_firstName $_lastName" ),
                      shadowColor: AppTheme.backGround,
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
                      shadowColor: AppTheme.backGround,
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
                      shadowColor: AppTheme.backGround,
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 45,
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    CustomReadOnlyFormField(
                      shadowColor: AppTheme.backGround,
                      focusedBorderColor: AppTheme.grey.withOpacity(0.5),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.5),
                      backgroundColor: AppTheme.white,
                      height: 45,
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
