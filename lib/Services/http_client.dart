import 'dart:convert';
import 'package:fuel_sale_app/constant/endpoints.dart';
import 'package:fuel_sale_app/model/get_all_card_for_user_model.dart';
import 'package:fuel_sale_app/model/vendor_response_model.dart';
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


 //addCard
 Future<Response> addCard ( String cardNumber, String token) async {
   var url = Uri.https(baseURL, addCreditCard);
   var body = {"cardNumber": cardNumber};
   final response = await post(url, headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Bearer $token"},body: jsonEncode(body));
   return response;
 }


 //GetAllCardSForAUser
 Future <List<GetAllCardForAUserResponseModel>>? userAllCardDetailsForUser(String token) async {
   var url = Uri.https(baseURL, getAllCardForAUser);
   final response = await get(url, headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Bearer $token"},);
   if(response.statusCode == 200 || response.statusCode == 201){
     return getAllCardForAUserResponseModelFromJson(response.body);
   } else{
     throw Exception("Fail to load data");
   }
 }

 //GetAllVendorAvailable
 Future <GetAllVendorModelResponse> getAllVendor(String token) async {
   var url = Uri.https(baseURL, getAllVendors);
   final response = await get(url, headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Bearer $token"},);
   if(response.statusCode == 200 || response.statusCode == 201) {
     return GetAllVendorModelResponse.fromJson(jsonDecode(response.body));
   } else {
     throw Exception("Fail to load data");
   }
 }

}