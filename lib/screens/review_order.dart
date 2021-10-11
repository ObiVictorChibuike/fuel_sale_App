import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/widgets/bottom_navigationbar_third_screen.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';

class ReviewOrder extends StatefulWidget {
  final String? title, product, quantity, paymentMethod;
  const ReviewOrder({Key? key, this.title, this.product, this.quantity, this.paymentMethod}) : super(key: key);

  @override
  _ReviewOrderState createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  bool? isDelivery = false;



  Widget reviewOrder(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 125,),
          CustomReadOnlyFormField(
            suffixIcon: Icon(Icons.arrow_drop_down_outlined, color: AppTheme.grey.withOpacity(0.4),),
            initialValue: widget.title!,
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 50,
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
          ),
          SizedBox(height: 49,),
          CustomReadOnlyFormField(
            initialValue: widget.product!,
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 50,
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
          ),
          SizedBox(height: 49,),
          CustomReadOnlyFormField(
            initialValue: widget.quantity!,
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 50,
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
          ),
          SizedBox(height: 49,),
          CustomReadOnlyFormField(
            suffixIcon: Icon(Icons.arrow_drop_down_outlined, color: AppTheme.grey.withOpacity(0.4),),
            initialValue: widget.paymentMethod! == 'Pay with card' ? '634xxxxxx343' : 'Bank',
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 50,
            textColor: AppTheme.grey.withOpacity(0.4),
            validator: (value){},
          ),
          SizedBox(height: 61,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: CustomButton(
                labelFontSize: 15,
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 30,
                buttonText: 'Start Delivery',
                buttonHeight: 36,
                onPressed: (){
                  setState(() {
                    isDelivery = true;
                  });
                  changeScreen(context, HomePage(isDelivery: isDelivery,));
                }
            ),
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
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[AppTheme.gradientBlue1, AppTheme.gradientBlue2],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, icon: Icon(Icons.arrow_back_ios,color: AppTheme.white,)),
                        SizedBox(width: 70,),
                        Container(child: Text('Review Order', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                      ],
                    ),
                  ],
                )
            ),
          ),
          body: reviewOrder(),
        )
    );
  }
}
