import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/Services/http_client.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/vendor_response_model.dart';
import 'package:fuel_sale_app/screens/homepage.dart';
import 'package:fuel_sale_app/utils/alert_dialog.dart';
import 'package:fuel_sale_app/utils/custom_alert_bar.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';

class ReviewOrder extends StatefulWidget {
  final String? product, quantity, paymentMethod, location;
  final double? longitude, latitude;
  final GetAllVendorModelResponse? title;
  const ReviewOrder({Key? key, this.title, this.product, this.quantity, this.paymentMethod, this.location, this.longitude, this.latitude}) : super(key: key);

  @override
  _ReviewOrderState createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  int deliveryFee = 300;
  int productPrice = 3000;
  int total = 3300;

  void checkPostTransactionConnectivity(String vendorId, cardId,riderId, addressId, unitprice, quantity,transAmount) async{
    FocusScope.of(context).unfocus();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      makeTransaction(vendorId, cardId, riderId, addressId, unitprice, quantity, transAmount);
    } else {
      alertBar(context, "No Internet Connection", AppTheme.red);
    }
  }

  void makeTransaction(String vendorId, cardId,riderId, addressId, unitprice, quantity,transAmount) async{
    CustomProgressDialog().showCustomAlertDialog(context, "Please wait...");
    await HttpService().makeTransaction(vendorId, cardId, riderId, addressId, unitprice, quantity, transAmount).then((value){
      if(value.statusCode == 200 || value.statusCode == 201){
        alertBar(context, "Transaction Successful", AppTheme.red);
        CustomProgressDialog().popCustomProgressDialogDialog(context);
        print(value.body);
      }
    }).catchError((error){
      alertBar(context, "Transaction failed", AppTheme.red);
      print(error);
    }).timeout(Duration(seconds: 20), onTimeout: (){
      CustomProgressDialog().popCustomProgressDialogDialog(context);
      alertBar(context, "Network timeout! Try again.", AppTheme.red);
      return null;
    });
  }

  Widget reviewOrder(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),),
              height: MediaQuery.of(context).size.height / 5.5, width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 15),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Delivery Details", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, fontFamily: "Lato"),),],),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                       Container(decoration: BoxDecoration(shape: BoxShape.circle),child: Image.asset("assets/timer.png"),),
                        SizedBox(width: 5,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("9 AM - 10 AM", style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.w200, fontSize: 13, color: AppTheme.dark_blue),),
                            Text("10-06-2021", style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.w200, fontSize: 13, color: AppTheme.dark_blue),),],)],),
                    SizedBox(height: 14,),
                    Row(
                      children: [
                        Container(decoration: BoxDecoration(shape: BoxShape.circle), child: Image.asset("assets/location.png"),),
                        SizedBox(width: 5,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Primary Address", style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.w200, fontSize: 13, color: AppTheme.dark_blue),),
                            Text(widget.location!, style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.w200, fontSize: 13, color: AppTheme.dark_blue),),],)],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Card(elevation: 2,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(height: MediaQuery.of(context).size.height / 6.5, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(12),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                   children: [SizedBox(height: 15,),
                   Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [Text("Card Details", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, fontFamily: "Lato"),),],),
                     Row(children: [
                         Container(height: 60, width: 60, decoration: BoxDecoration(shape: BoxShape.circle,),child: Image.asset('assets/logo.png',)),
                         SizedBox(width: 20,),
                         Column(crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 10,),
                             Text("**** **** **** 4826 Mastercard", style: TextStyle(fontSize: 13, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                             SizedBox(height: 20,),
                             Text('N487,000.12', style: TextStyle(fontSize: 17, fontFamily: 'Lato', fontWeight: FontWeight.w600, color: AppTheme.dark_blue),),
                           ],
                         ),
                       ],
                     ),
                   ],
                 ),
              ),
            ),
          ),
           SizedBox(height: 20,),
           Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
             child: Container(height: MediaQuery.of(context).size.height / 4, width: double.maxFinite,
               decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(12),),
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 27.0,vertical: 18),
                 child: Column(
                   children: [
                     Row(mainAxisAlignment: MainAxisAlignment.start,
                       children: [Text("Order Summary", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, fontFamily: "Lato"),),],),
                     SizedBox(height: 20,),
                     Row(mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text(widget.title!.businessName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Lato", color: AppTheme.dark_blue),),],),
                     SizedBox(height: 10,),
                     Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(widget.product!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, fontFamily: "Lato", color: AppTheme.grey.withOpacity(0.5)),),
                          Text(widget.quantity!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, fontFamily: "Lato", color: AppTheme.grey.withOpacity(0.5)),),
                          Text(productPrice.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, fontFamily: "Lato", color: AppTheme.grey.withOpacity(0.5)),),
                        ],),
                      SizedBox(height: 10,),
                      Row(children: [
                         Text("Delivery Fee", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, fontFamily: "Lato", color: AppTheme.grey.withOpacity(0.5)),),
                         Spacer(),
                         Text(deliveryFee.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, fontFamily: "Lato", color: AppTheme.grey.withOpacity(0.5)),),
                       ],),],
                     ),
                     Spacer(),
                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Total", style: TextStyle(fontFamily: "Lato", fontWeight: FontWeight.w500, fontSize: 23, color: AppTheme.dark_blue),)],),
                     SizedBox(height: 13,),
                     Text('N ${total.toString()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, fontFamily: "Lato", color: AppTheme.grey.withOpacity(0.5)),),
                   ],
                 ),
               ),
             ),
           ),
          SizedBox(height: 61,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: CustomButton(
                labelFontSize: 15,
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 30,
                buttonText: 'Checkout',
                buttonHeight: 45,
                onPressed: (){
                  checkPostTransactionConnectivity(widget.title!.businessName, "MasCard", "Rider", widget.location, "200", widget.quantity, total.toString());
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon: Icon(Icons.arrow_back_ios,color: AppTheme.white,)),
                          SizedBox(width: 80,),
                          Container(child: Text('Review Order', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                        ],
                      ),
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
