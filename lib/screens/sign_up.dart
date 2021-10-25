import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/sign_up_model.dart';
import 'package:fuel_sale_app/repository/cached_data.dart';
import 'package:fuel_sale_app/screens/email_verification.dart';
import 'package:fuel_sale_app/screens/login.dart';
import 'package:fuel_sale_app/utils/alert_dialog.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_dropdown_field.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final List<String> sex = ['Male','Female'];
  String sexInitialValue = "Male";

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  void signUP(BuildContext context) async{
    CustomProgressDialog().showCustomAlertDialog(context, "Please wait...");
    await HttpService().userSignUp(_firstName.text.trim(), _lastName.text.trim(), _phoneNumber.text.trim(), _email.text.trim(), sexInitialValue.toString(), _dob.text.trim(), _password.text.trim(), _confirmPassword.text.trim()).then((value) {
      var result = jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201) {
        print("successful");
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        final response = signUpResponseFromJson(value.body);
        CachedData().saveUserdata(response);
        changeScreen(context, EmailVerificationScreen());
        print(response);
        print(value.statusCode);
      }
      else {
        print("error");
        print(value.statusCode);
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        //var errorMsg = result["errors"]["email"][0];
        var errorMsg = result["message"];
        alertBar(context, errorMsg, AppTheme.red);
        print(errorMsg);

      }
    }).timeout(Duration(seconds: 20), onTimeout: (){
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
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/landing_page.png'),
                      fit: BoxFit.cover,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60,),
                      Container(
                        height: MediaQuery.of(context).size.width / 10,
                        width: MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png')
                          )
                        ),
                      ),
                      SizedBox(height: 70,),
                      Text('Welcome', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24, fontFamily: 'Lato', color: AppTheme.white),),
                      SizedBox(height: 18,),
                      Text('Complete your registration', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, fontFamily: 'Lato', color: AppTheme.white),),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppTheme.backGround,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 37, top: 40),
                      child: Column(
                        children: [
                          CustomFormField(
                            controller: _firstName,
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Please, your first name is required';
                                }else {
                                  return null;
                                }
                              },
                            labelText: 'First Name',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 16,),
                          CustomFormField(
                            controller: _lastName,
                            validator: (value){},
                            labelText: 'Last Name',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 16,),
                          CustomFormField(
                            controller: _email,
                            validator: (value){},
                            labelText: 'Email',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 16,),
                          CustomFormField(
                            controller: _phoneNumber,
                            validator: (value){},
                            labelText: '+234',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomDropDownButton(
                                height: 66,
                                  hint: Text('Gender', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
                                  underline: Container(),
                                  value: sexInitialValue,
                                  onChanged: (newValue){
                                    setState(() {
                                      sexInitialValue = newValue;
                                    });
                                  },
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context).size.width / 4
                                        ),
                                        child: Icon(Icons.arrow_drop_down_outlined)),
                                  ),
                                  items: sex.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text('\t\t ${value.toString()}'),
                                    );
                                  }).toList(),
                                elevation: 5,
                              ),
                              Spacer(),
                              CustomFormatterFormField(
                                keyboardType: TextInputType.number,
                                width: MediaQuery.of(context).size.width / 3,
                                controller: _dob,
                                  validator: (value){},
                                labelText: "1990-02-29",
                                focusedBorderColor: AppTheme.white,
                                enabledBorderColor: AppTheme.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          CustomPasswordFormField(
                            controller: _password,
                            validator: (value){},
                            labelText: 'Password',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 16,),
                          CustomPasswordFormField(
                            controller: _confirmPassword,
                            validator: (value){},
                            labelText: 'Password Confirmation',
                            focusedBorderColor: AppTheme.white,
                            enabledBorderColor: AppTheme.white,
                          ),
                          SizedBox(height: 28,),
                          CustomButton(
                            buttonRadius: 14,
                            onPressed: (){
                              signUP(context);
                            },
                            buttonText: 'Sign Up',
                            buttonHeight: 54,
                            decorationColor: AppTheme.blue,
                            borderColor: AppTheme.blue,
                          ),
                          SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      fontFamily: 'Lato',
                                      color: AppTheme.blue)),
                              InkWell(
                                onTap: () {
                                  changeScreen(context, LoginScreen());
                                },
                                child: Text(' Login in',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      fontFamily: 'Lato',
                                      color: AppTheme.blue,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
