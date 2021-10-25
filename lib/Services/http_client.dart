import 'dart:convert';
import 'package:fuel_sale_app/constant/endpoints.dart';
import 'package:http/http.dart';


class HttpService{

  //Login
 Future <Response> userLogin (String email, String password) async {
   var url = Uri.https(baseURL, postLogin);
   var body = {'email': email, 'password' : password};
   final response = await post(url,headers: {"Content-Type": "application/json", "Accept": "application/json"}, body: jsonEncode(body));
   return response;
 }

 //SignUp
 Future <Response> userSignUp (String firstName, String lastName, String phoneNumber, String email, String sex, String dob, String password, String confirmPassword) async {
   var url = Uri.https(baseURL, postRegister);
   var body = {"firstname": firstName, "lastname": lastName, "tel": phoneNumber, "email": email, "sex": sex, "dob": dob, "password" : password, "password_confirmation": confirmPassword};
   final response = await post(url,headers: {"Content-Type": "application/json", "Accept": "application/json"}, body: jsonEncode(body));
   return response;
 }

}