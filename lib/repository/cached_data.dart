import 'package:fuel_sale_app/model/userDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryService{

  Future<void> saveUserdata(SignUpResponseFromOtpValidation response) async {
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
}