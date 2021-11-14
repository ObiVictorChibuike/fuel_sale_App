import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/screens/reset_password_otp.dart';
import 'package:fuel_sale_app/screens/sign_up_screen.dart';
import 'package:fuel_sale_app/utils/alert_dialog.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _passwordValidator = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final _emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void checkLoginNowConnectivity(BuildContext context) async{
    FocusScope.of(context).unfocus();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      loginNow(context);
    } else {
      alertBar(context, "No Internet Connect", AppTheme.red);
    }
  }
    void loginNow(BuildContext context){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      login(context);
    }
  }


  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void login(BuildContext context) async{
    CustomProgressDialog().showCustomAlertDialog(context, "Please wait...");
    await HttpService().userLogin(_email.text.trim(), _password.text.trim()).then((value) {
      var result = jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201) {
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        //final response = loginResponseFromJson(value.body);
        changeScreen(context, HomePage());
      }
      else {
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        var errorMsg = result["message"];
        alertBar(context, errorMsg, AppTheme.red);
      }
    })
    .timeout(Duration(seconds: 20), onTimeout: (){
    CustomProgressDialog().popCustomProgressDialogDialog(context);
    alertBar(context, "Network timeout! Try again.", AppTheme.red);
    return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/landing_page.png'), fit: BoxFit.cover,)),
                ),
                Align(alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppTheme.backGround,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 37, top: 40),
                      child: Column(
                        children: [
                          CustomFormField(
                            keyboardType: TextInputType.text,
                            controller: _email,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Email form cannot be empty';
                              }
                              // else if (!_emailValidator.hasMatch(value)){
                              //   return 'Please, provide a valid email';
                              // }
                              else {
                                return null;}
                            },
                            labelText: 'Email',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 22,),
                          CustomPasswordFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _password,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Password form cannot be empty';
                              }
                              // else if (!_passwordValidator.hasMatch(value)){
                              //   return 'Password is weak';
                              // }
                              else {
                                return null;
                              }
                            },
                            labelText: 'Password',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 30,),
                          CustomButton(
                            buttonRadius: 14,
                            onPressed: () {
                              checkLoginNowConnectivity(context);
                            },
                            buttonText: 'Log In',
                            buttonHeight: 54,
                            decorationColor: AppTheme.blue,
                            borderColor: AppTheme.blue,
                          ),
                          SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Forget password? ',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17, fontFamily: 'Lato', color: AppTheme.grey)),
                              InkWell(
                                onTap: () {
                                  changeScreen(context, ResetPasswordOtp());
                                },
                                child: Text('Click here', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, fontFamily: 'Lato', color: AppTheme.blue,)),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Not registered yet? ',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17, fontFamily: 'Lato', color: AppTheme.grey)),
                              InkWell(
                                onTap: () {
                                  changeScreen(context, SignUpScreen());
                                },
                                child: Text('Create Account',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, fontFamily: 'Lato', color: AppTheme.blue,)),
                              ),
                            ],
                          ),
                          SizedBox(height:  81,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
