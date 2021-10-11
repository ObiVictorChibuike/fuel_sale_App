import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/confirm_deposit.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_dropdown_field.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {

  String dropdownInitialValue = 'GT Bank';
  final List<String> banks = ['GT Bank', 'Access Bank', 'First Bank', 'Sterling Bank', 'Eco Bank', 'Kuda Bank', 'Union Bank', 'UBA Bank'];

  Widget depositToCard({void Function()? onTap}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Text('Select Bank', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
          SizedBox(height: 3,),
          CustomDropDownButton(
            hint: Text('Select Bank', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: dropdownInitialValue,
              onChanged: (newValue){
                setState(() {
                  dropdownInitialValue = newValue;
                });
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 4
                    ),
                    child: Icon(Icons.arrow_drop_down_outlined)),
              ),
              items: banks.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text('\t\t ${value.toString()}'),
                );
              }).toList()
          ),
          SizedBox(height: 40,),
          Text('Preferred Display Name', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
          SizedBox(height: 3,),
          CustomFormField(
            backgroundColor: AppTheme.white,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            enabledBorderColor: AppTheme.grey.withOpacity(0.4),
            focusedBorderColor: AppTheme.grey.withOpacity(0.4),
            height: 46,
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
          ),
          SizedBox(height: 40,),
          Text('Card Number', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
          SizedBox(height: 3,),
          CustomFormField(
            backgroundColor: AppTheme.white,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            enabledBorderColor: AppTheme.grey.withOpacity(0.4),
            focusedBorderColor: AppTheme.grey.withOpacity(0.4),
            height: 48,
            labelText: '4287 8874 9511 3263',
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
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
          SizedBox(height: 40,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expiry date', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
                  SizedBox(height: 3,),
                  CustomFormField(
                    width: MediaQuery.of(context).size.width/ 3,
                    backgroundColor: AppTheme.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    enabledBorderColor: AppTheme.grey.withOpacity(0.4),
                    focusedBorderColor: AppTheme.grey.withOpacity(0.4),
                    height: 46,
                    labelText: 'MM / YY',
                    textColor: AppTheme.grey.withOpacity(0.4),
                    validator: (value){},
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
                    width: MediaQuery.of(context).size.width/ 3,
                    backgroundColor: AppTheme.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    enabledBorderColor: AppTheme.grey.withOpacity(0.4),
                    focusedBorderColor: AppTheme.grey.withOpacity(0.4),
                    height: 46,
                    labelText: '***',
                    textColor: AppTheme.grey.withOpacity(0.4),
                    validator: (value){},
                  ),
                ],
              ),
            ],
          ),
          Text('Expiry date', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
          SizedBox(height: 61,),
          CustomButton(
              decorationColor: AppTheme.dark_blue,
              buttonRadius: 5,
              buttonText: 'Proceed',
              buttonHeight: 48,
              onPressed: (){
                changeScreen(context, ConfirmDeposit());
              }
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.backGround,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppTheme.backGround,
            leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios, color: AppTheme.dark_blue,)),
          ),
          body: depositToCard(),
        ),
    );
  }
}
