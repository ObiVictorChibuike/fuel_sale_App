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
   var body = {"firstname": firstName, "lastname": lastName, "tel": phoneNumber, "email": email, "sex": sex, "dob": dob, "password": password, "password_confirmation": confirmPassword};
   final response = await post(url,headers: {"Content-Type": "application/json", "Accept": "application/json"}, body: jsonEncode(body));
   return response;
 }

 //GetUserDetail
 Future<Response> userDetails(String token) async {
   var url = Uri.https(baseURL, getUserDetails);
   final response = await get(url, headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Bearer $token"},);
   return response;
 }

 //OtpVerification
 Future<Response> validateOTP(String email, String otp, ) async {
   var url = Uri.https(baseURL, otpValidation);
   var body = {"email": email, "otp": otp};
   final response = await post(url, headers: {"Content-Type": "application/json", "Accept": "application/json"},body: jsonEncode(body));
   return response;
 }

 //OtpVerification
 Future<Response> addCard (String cardType, String cardName, String cardNumber, String ccv, String expiryDate, String pin, String vendorId, String token) async {
   var url = Uri.https(baseURL, addCreditCard);
   var body = {"cardtype": cardType, "cardName": cardName, "cardNumber": cardNumber, "ccv":ccv, "expiryDate": expiryDate, "pin":pin, "vendorId":vendorId};
   final response = await post(url, headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Bearer $token"},body: jsonEncode(body));
   return response;
 }

}