import 'package:fuel_sale_app/model/login_model.dart';
import 'package:fuel_sale_app/model/sign_up_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedData{
  Future<void> saveUserdata(SignUpResponse response) async {
    final SharedPreferences signUpUserData = await SharedPreferences.getInstance();
    signUpUserData.setString("firstName", response.user.firstname);
    signUpUserData.setString("lastName", response.user.lastname);
    signUpUserData.setString("userEmail", response.user.email);
    signUpUserData.setString("userPhoneNumber", response.user.tel);
    signUpUserData.setString("userSex", response.user.sex);
    signUpUserData.setString("userDOB", response.user.dob.toString());
    signUpUserData.setString("token", response.token);
  }
}