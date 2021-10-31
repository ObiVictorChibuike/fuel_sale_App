import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/add_card_model.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/utils/alert_dialog.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_dropdown_field.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> vendor = ['Zaco Oils','Tonimas',"Gabbey Oil", "Texaco", "NNPC", "Mobil", "Conoil"];
  final List<String> card = ['Mastercard','Verve',"Visa"];
  String cardInitialValue = "Mastercard";
  String vendorInitialValue = "Zaco Oils";
  var _token;

  TextEditingController _cardNameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _ccvController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  TextEditingController _vendorIdController = TextEditingController();
  TextEditingController _cardTypeController = TextEditingController();

  MaskInputFormatter myExpiryDateFormatter =  MaskInputFormatter(mask: '####-##-##');
  MaskInputFormatter myCardNumberFormatter =  MaskInputFormatter(mask: '####-####-####-####');

  void fetchToken() async {
    final SharedPreferences getToken = await SharedPreferences.getInstance();
    setState(() {
      _token = (getToken.getString("token"));
    });
  }


  @override
  void initState() {
    fetchToken();
    super.initState();
  }

  void checkAddNowConnectivity() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      signUpNow();
    } else {
      alertBar(context, "No Internet Connection", AppTheme.red);
    }
  }

  void signUpNow(){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      addCardNow();
    }
  }

  addCardNow() async {
    CustomProgressDialog().showCustomAlertDialog(context, "Please wait...");
    await HttpService().addCard(_cardTypeController.text.trim(), _cardNameController.text.trim(), _cardNumberController.text.trim(), _ccvController.text.trim(), _expiryDateController.text.trim(), _pinController.text.trim(), _vendorIdController.text.trim(), _token).then((value) async{
      var result= jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201) {
        final response = addCardResponseModelFromJson(value.body);
        alertBar(context, "Card Added Successfully", AppTheme.red);
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        replaceScreen(context, HomePage());
        print(response);
      } else {
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        var errorMsg = result["message"];
        alertBar(context, errorMsg, AppTheme.red);}
    }).timeout(Duration(seconds: 20), onTimeout: (){
      alertBar(context, "Network Timeout", AppTheme.red);
      return null;
    });
  }

  Widget cardAdded(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 118,
              width: 118,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.dark_blue.withOpacity(0.5),
              ),
              child: Center(
                child: Container(
                  height: 78,
                  width: 78,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.dark_blue,
                  ),
                  child: Image.asset('assets/good.png'),
                ),
              ),
            ),
          ),
          SizedBox(height: 37,),
          Text('Card added', style: TextStyle(fontSize: 32, fontFamily: 'Nunito', fontWeight: FontWeight.w700, color: AppTheme.dark_blue),),
          SizedBox(height: 15,),
          Text('You can begin transaction with this card', style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Lato', fontSize: 14, color: AppTheme.dark_blue),)
        ],
      );
  }
  Widget addCardWidget(){
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 40,),
            Text('Vendors', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
            SizedBox(height: 3,),
            CustomDropDownButton(
              borderColor: AppTheme.grey.withOpacity(0.2),
              elevation: 0.0,
              width: MediaQuery.of(context).size.width, height: 50,
              hint: Text('Gender', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: vendorInitialValue,
              onChanged: (newValue){setState(() {vendorInitialValue = newValue;});},
              icon: Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width /4), child: Icon(Icons.arrow_drop_down_outlined)),),
              items: vendor.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('\t\t ${value.toString()}'),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),
            Text('Card Name', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
            CustomDropDownButton(
              borderColor: AppTheme.grey.withOpacity(0.2),
              elevation: 0.0,
              width: MediaQuery.of(context).size.width, height: 50,
              hint: Text('Gender', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: cardInitialValue,
              onChanged: (newValue){setState(() {cardInitialValue = newValue;});},
              icon: Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width /4), child: Icon(Icons.arrow_drop_down_outlined)),),
              items: card.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('\t\t ${value.toString()}'),
                );
              }).toList(),
            ),
            SizedBox(height: 20,),
            Text('Preferred Display Name', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
            SizedBox(height: 3,),
            CustomFormField(
              elevation: 0.0,
              controller: _cardTypeController,
              backgroundColor: AppTheme.white,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              enabledBorderColor: AppTheme.grey.withOpacity(0.4),
              focusedBorderColor: AppTheme.grey.withOpacity(0.4),
              height: 46,
              labelText: 'James Chukwu',
              textColor: AppTheme.grey.withOpacity(0.4),
              validator: (value){
                if (value!.isEmpty) {
                  return "Please, Platinum Card form cannot be empty";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 20,),
            Text('Card Number', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
            SizedBox(height: 3,),
            CustomFormField(
              validator: (value){
                if (value!.isEmpty) {
                  return "Please, Card Number form cannot be empty";
                } else {
                  return null;
                }
              },
              elevation: 0.0,
              controller: _cardNumberController,
              backgroundColor: AppTheme.white,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              enabledBorderColor: AppTheme.grey.withOpacity(0.4),
              focusedBorderColor: AppTheme.grey.withOpacity(0.4),
              height: 46,
              labelText: '4287 8874 9511 3263',
              textColor: AppTheme.grey.withOpacity(0.4),
              suffixIcon:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width / 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppTheme.dark_blue.withOpacity(0.1)
                    ),
                    child: Image.asset('assets/visa_card.png', height: 20,width: 20,)),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expiry date', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
                    SizedBox(height: 3,),
                    CustomFormField(
                      inputFormatters: [myExpiryDateFormatter],
                      elevation: 0.0,
                      controller: _expiryDateController,
                      width: MediaQuery.of(context).size.width/ 3,
                      backgroundColor: AppTheme.white,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      enabledBorderColor: AppTheme.grey.withOpacity(0.4),
                      focusedBorderColor: AppTheme.grey.withOpacity(0.4),
                      height: 46,
                      labelText: 'YYYY/MM//DD',
                      textColor: AppTheme.grey.withOpacity(0.4),
                      validator: (value){
                        if (value!.isEmpty) {
                          return "Please, Expiry date form cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CV2', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
                    SizedBox(height: 3,),
                    CustomCV2PasswordFormField(
                      elevation: 0.0,
                      controller: _ccvController,
                      width: MediaQuery.of(context).size.width/ 3,
                      backgroundColor: AppTheme.white,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enabledBorderColor: AppTheme.grey.withOpacity(0.4),
                      focusedBorderColor: AppTheme.grey.withOpacity(0.4),
                      height: 46,
                      labelText: '***',
                      textColor: AppTheme.grey.withOpacity(0.4),
                      validator: (value){
                        if (value!.isEmpty) {
                          return "Please, CV2 form cannot be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text('Pin', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
            SizedBox(height: 3,),
            CustomPasswordFormField(
              elevation: 0.0,
              width: MediaQuery.of(context).size.width/ 3,
              backgroundColor: AppTheme.white,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              enabledBorderColor: AppTheme.grey.withOpacity(0.4),
              focusedBorderColor: AppTheme.grey.withOpacity(0.4),
              height: 46,
              controller: _pinController,
              validator: (value){
                if (value!.isEmpty) {
                  return "Please, pin form cannot be empty";
                } else {
                  return null;
                }
              },
              labelText: '****',
            ),
            SizedBox(height: 61,),
            CustomButton(
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 5,
                buttonText: 'Add',
                buttonHeight: 48,
                onPressed: (){
                  checkAddNowConnectivity();
                }
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: AppTheme.backGround,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppTheme.dark_blue,),
              onPressed: (){Navigator.of(context).pop();},
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                addCardWidget(),
                SizedBox(height: 400,),
              ],
            ),
          )),
        )
    );
  }
}
