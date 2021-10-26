import 'package:flutter/cupertino.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/model/sign_up_model.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/screens/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryService{
  bool? _userdata;

  Future<void> saveUserdata(SignUpResponse response) async {
    final SharedPreferences signUpUserData = await SharedPreferences.getInstance();
    signUpUserData.setString("firstName", response.user.firstname);
    signUpUserData.setString("lastName", response.user.lastname);
    signUpUserData.setString("userEmail", response.user.email);
    signUpUserData.setString("userPhoneNumber", response.user.tel);
    signUpUserData.setString("userSex", response.user.sex);
    signUpUserData.setString("userDOB", response.user.dob.toString());
    signUpUserData.setString("token", response.token);
    signUpUserData.setBool('isLoggedIn', true);
  }

  Future checkLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userdata = (prefs.getBool('isLoggedIn') ?? false);
    if (_userdata == true) {
      replaceScreen(context, HomePage());
    }
    changeScreen(context, SignUpScreen());
  }
}