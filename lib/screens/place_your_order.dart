import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/vendor_response_model.dart';
import 'package:fuel_sale_app/screens/review_order.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_dropdown_field.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
class PlaceYourOrder extends StatefulWidget {
  const PlaceYourOrder({Key? key, this.title, this.product, this.quantity, this.address, required this.token}) : super(key: key);
  final String? title, product, quantity, address;
  final String token;

  @override
  _PlaceYourOrderState createState() => _PlaceYourOrderState();
}

class _PlaceYourOrderState extends State<PlaceYourOrder> {

  getAllVendor() async{
    await HttpService().getAllVendor(widget.token)!.then((value) {
      setState(() {data = value;});
    });
  }

  List <GetAllVendorModelResponse>? data;
  GetAllVendorModelResponse? dropdownInitialValue ;

  late double longitude;
  late double latitude;
  var _product;
  String cardId = "634xxxxxxx343 ";
  String location = "12th Street Ikeja, Lagos State";
  final List<String> locations = ['12th Street Ikeja, Lagos State','1th Orlu Junction, Imo State','11th Street Ikeja, Abia State', '30 St Anthony, Lagos State',"15th Street Ikeja, Kaduna State"];

  @override
  void initState() {
    getAllVendor();
    setState(() {
      _product = widget.product;
    });
    super.initState();
  }
  final List<String> product = ['Petrol','Diesel','Kerosene', 'Oil'];

  Widget placeYourOrder(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100,),
          CustomDropDownButton(
              elevation: 1,
            height: 53,
            width: MediaQuery.of(context).size.width,
              hint: Text('Select Station', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: dropdownInitialValue,
              onChanged: (value){
                setState(() {
                  dropdownInitialValue = value;
                  longitude = dropdownInitialValue!.longitude;
                  latitude = dropdownInitialValue!.latitude;
                });
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 4
                    ),
                    child: Icon(Icons.arrow_drop_down_outlined)),
              ),
              items: data!.map<DropdownMenuItem<GetAllVendorModelResponse?>>((GetAllVendorModelResponse item) {
                return DropdownMenuItem<GetAllVendorModelResponse?>(
                  value: item,
                  child: Text(item.businessName, style: TextStyle(fontSize: 16, fontFamily: "Lato", fontWeight: FontWeight.w200),),
                );
              }).toList()
          ),
          SizedBox(height: 40,),
          CustomDropDownButton(
              elevation: 1,
              height: 53,
              width: MediaQuery.of(context).size.width,
              hint: Text('Select Product', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: _product,
              onChanged: (value){
                setState(() {
                  _product = value;
                });
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 4
                    ),
                    child: Icon(Icons.arrow_drop_down_outlined)),
              ),
              items: product.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item.toString(), style: TextStyle(fontSize: 16, fontFamily: "Lato", fontWeight: FontWeight.w200),),
                );
              }).toList()
          ),
          SizedBox(height: 40,),
          CustomReadOnlyFormField(
            elevation: 1,
            initialValue: widget.quantity!,
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 53,
            textColor: AppTheme.grey.withOpacity(0.4),
          ),
          SizedBox(height: 40,),
          CustomReadOnlyFormField(
            elevation: 1,
            initialValue: cardId,
            backgroundColor: AppTheme.white,
            enabledBorderColor: AppTheme.white,
            focusedBorderColor: AppTheme.white,
            height: 53,
            textColor: AppTheme.grey.withOpacity(0.4),
          ),
          SizedBox(height: 40,),
          CustomDropDownButton(
              elevation: 1,
              height: 53,
              width: MediaQuery.of(context).size.width,
              hint: Text('Select Address', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Nunito', fontSize: 15, color: AppTheme.grey.withOpacity(0.5)),),
              underline: Container(),
              value: location,
              onChanged: (value){
                setState(() {
                  location = value;
                });
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 4
                    ),
                    child: Icon(Icons.arrow_drop_down_outlined)),
              ),
              items: locations.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item.toString(), style: TextStyle(fontSize: 16, fontFamily: "Lato", fontWeight: FontWeight.w200),),
                );
              }).toList()
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: CustomButton(
              labelFontSize: 15,
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 30,
                buttonText: 'Proceed',
                buttonHeight: 45,
                onPressed: (){
                changeScreen(context, ReviewOrder(product: widget.product, quantity: widget.quantity,title: dropdownInitialValue, paymentMethod: cardId));
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
          resizeToAvoidBottomInset: false,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon: Icon(Icons.arrow_back_ios,color: AppTheme.white,)),
                          SizedBox(width: 80,),
                          Container(child: Text('Place Your Order', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
          body: data == null ? Container(child: Center(child: CupertinoActivityIndicator(radius: 20,),),) : placeYourOrder(),
        ),
    );
  }
}
