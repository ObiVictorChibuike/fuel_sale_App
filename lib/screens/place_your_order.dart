import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/review_order.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_dropdown_field.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
class PlaceYourOrder extends StatefulWidget {
  const PlaceYourOrder({Key? key, this.title, this.product, this.quantity, this.address}) : super(key: key);
  final String? title, product, quantity, address;

  @override
  _PlaceYourOrderState createState() => _PlaceYourOrderState();
}

class _PlaceYourOrderState extends State<PlaceYourOrder> {

  String stationDropdownInitialValue = 'Zaco Oils';
  final List<String> stations = ['Zaco Oils', 'Tonimas', 'Bonimas', 'Gabbey Oil', 'Keml Oil', 'Chevryl Oil', 'NNPC', 'Mobil'];
  String paymentMethodDropdownInitialValue = 'Pay with card';
  final List<String> paymentMethods = ['Pay with card','Pay with Bank'];

  Widget placeYourOrder(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 125,),
          CustomDropDownButton(
              hint: Text('Select Station', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: stationDropdownInitialValue,
              onChanged: (newValue){
                setState(() {
                  stationDropdownInitialValue = newValue;
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
              items: stations.map<DropdownMenuItem<String>>((String stationValue) {
                return DropdownMenuItem<String>(
                  value: stationValue,
                  child: Text('\t\t ${stationValue.toString()}'),
                );
              }).toList()
          ),
          SizedBox(height: 49,),
          CustomReadOnlyFormField(
            initialValue: widget.product!,
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 50,
            textColor: AppTheme.grey.withOpacity(0.4),
          ),
          SizedBox(height: 49,),
          CustomReadOnlyFormField(
            initialValue: widget.quantity!,
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 50,
            textColor: AppTheme.grey.withOpacity(0.4),
          ),
          SizedBox(height: 49,),
          CustomDropDownButton(
              hint: Text('Payment Method', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: paymentMethodDropdownInitialValue,
              onChanged: (newValue){
                setState(() {
                  paymentMethodDropdownInitialValue = newValue;
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
              items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('\t\t ${value.toString()}'),
                );
              }).toList()
          ),
          SizedBox(height: 61,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: CustomButton(
              labelFontSize: 15,
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 30,
                buttonText: 'Proceed',
                buttonHeight: 36,
                onPressed: (){
                changeScreen(context, ReviewOrder(product: widget.product, quantity: widget.quantity,title: stationDropdownInitialValue, paymentMethod: paymentMethodDropdownInitialValue,));
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
                        Container(child: Text('Place Your Order', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                      ],
                    ),
                  ],
                )
            ),
          ),
          body: placeYourOrder(),
        ),
    );
  }
}
