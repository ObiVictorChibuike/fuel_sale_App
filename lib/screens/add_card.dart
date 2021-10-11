import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Text('Card Name', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
          SizedBox(height: 3,),
          CustomReadOnlyFormField(
            backgroundColor: AppTheme.white,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            enabledBorderColor: AppTheme.grey.withOpacity(0.4),
            focusedBorderColor: AppTheme.grey.withOpacity(0.4),
            height: 46,
            labelText: 'JOHN JAMES JOB',
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
          ),
          SizedBox(height: 40,),
          Text('Preferred Display Name', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
          SizedBox(height: 3,),
          CustomReadOnlyFormField(
            backgroundColor: AppTheme.white,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            enabledBorderColor: AppTheme.grey.withOpacity(0.4),
            focusedBorderColor: AppTheme.grey.withOpacity(0.4),
            height: 46,
            labelText: 'Platinum Card',
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
          ),
          SizedBox(height: 40,),
          Text('Card Number', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 12, color: AppTheme.dark_blue),),
          SizedBox(height: 3,),
          CustomReadOnlyFormField(
            backgroundColor: AppTheme.white,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            enabledBorderColor: AppTheme.grey.withOpacity(0.4),
            focusedBorderColor: AppTheme.grey.withOpacity(0.4),
            height: 46,
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
                  CustomReadOnlyFormField(
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
          SizedBox(height: 61,),
          CustomButton(
              decorationColor: AppTheme.dark_blue,
              buttonRadius: 5,
              buttonText: 'Add',
              buttonHeight: 48,
              onPressed: (){}
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
          appBar: AppBar(
            backgroundColor: AppTheme.backGround,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppTheme.dark_blue,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          body: addCardWidget(),
        )
    );
  }
}
