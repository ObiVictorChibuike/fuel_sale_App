import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmDeposit extends StatelessWidget {
  final String? longitude;
  final String? latitude;
  const ConfirmDeposit({Key? key, this.longitude, this.latitude})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget optWidget() {
      return PinCodeTextField(
        textStyle: TextStyle(color: AppTheme.dark_blue),
        pinTheme: PinTheme(
          inactiveFillColor: AppTheme.white,
          activeColor: AppTheme.white,
          errorBorderColor: AppTheme.white,
          selectedColor: AppTheme.white,
          selectedFillColor: AppTheme.white,
          inactiveColor: AppTheme.white,
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 20,
          fieldWidth: 20,
          activeFillColor: Colors.white,
        ),
        keyboardType: TextInputType.phone,
        animationType: AnimationType.fade,
        animationDuration: Duration(milliseconds: 300),
        textCapitalization: TextCapitalization.words,
        errorAnimationDuration: 500,
        cursorHeight: 25,
        cursorColor: AppTheme.dark_blue,
        textInputAction: TextInputAction.done,
        obscureText: true,
        appContext: context,
        length: 4,
        onChanged: (value) {},
      );
    }

    Widget confirmDeposit() {
      return Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.grey.withOpacity(0.5),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Bank',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.grey.withOpacity(0.5),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Account Number',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.grey.withOpacity(0.5),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Account Name',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.grey.withOpacity(0.5),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '500,000',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.dark_blue,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Access Bank',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.dark_blue,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '023 811 630',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.dark_blue,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'James Chukwu',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.dark_blue,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 74,
          ),
          Text(
            'Input Card Pin',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w500,
                color: AppTheme.dark_blue),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Container(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.dark_blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: optWidget(),
            ),
          ),
          SizedBox(
            height: 191,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: CustomButton(
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 5,
                buttonText: 'Proceed',
                buttonHeight: 48,
                onPressed: () {}),
          ),
        ],
      );
    }

    Widget cardCredited() {
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
          SizedBox(
            height: 20,
          ),
          Text(
            'Funds Credited',
            style: TextStyle(
                fontSize: 32,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                color: AppTheme.dark_blue),
          ),
          SizedBox(
            height: 15,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.7),
              child: new Text(
                'Your Card has been Successfully funded with N500,000',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    color: AppTheme.dark_blue),
              )),
        ],
      );
    }

    Widget errorOOPS() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 118,
              width: 118,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.red.withOpacity(0.5),
              ),
              child: Center(
                child: Container(
                  height: 78,
                  width: 78,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.red,
                  ),
                  child: Image.asset('assets/good.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Oops!',
            style: TextStyle(
                fontSize: 32,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                color: AppTheme.dark_blue),
          ),
          SizedBox(
            height: 15,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.9),
              child: new Text(
                'Sorry we are not able to reach your financial institution at the moment.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    color: AppTheme.dark_blue),
              )),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.7),
              child: new Text(
                'Try again later add another bank.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    color: AppTheme.dark_blue),
              )),
        ],
      );
    }

    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppTheme.backGround,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppTheme.backGround,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.dark_blue,
                )),
          ),
          body: confirmDeposit(),
        ));
  }
}
