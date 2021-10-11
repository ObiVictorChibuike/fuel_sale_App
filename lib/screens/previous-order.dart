import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/previous_order_dummy_model.dart';
import 'package:fuel_sale_app/screens/place_your_order.dart';
import 'package:fuel_sale_app/widgets/custom_button.dart';
import 'package:fuel_sale_app/widgets/custom_formfield.dart';
class PreviousOrder extends StatefulWidget {
  const PreviousOrder({Key? key}) : super(key: key);

  @override
  _PreviousOrderState createState() => _PreviousOrderState();
}

class _PreviousOrderState extends State<PreviousOrder> {

  Widget _noPreviousDelivery(){
    return Center(
      child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 2
          ),
          child: new Text('There are no previous \t\t\t\t\t\t\t\t\t\t\t\torder', style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Lato', fontSize: 20, color: AppTheme.grey.withOpacity(0.5)),)),
    );
  }

  static List<PreviousOrderData> previousOrderData = [
    PreviousOrderData(
      title: 'Tonimas',
      product: 'Petrol',
      quantity: '10 Litres',
      dateTime: '15, june, 2021',
      address: '2, Umugasi, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'Zaco Oils',
      product: 'Petrol',
      quantity: '15 Litres',
        dateTime: '1, june, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'Tonimas',
      product: 'Petrol',
      quantity: '10 Litres',
        dateTime: '17, june, 2021',
        address: '1, Eziukwu, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'Bonimas',
      product: 'Petrol',
      quantity: '20 Litres',
        dateTime: '15, August, 2021',
        address: '2, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'Tonimas',
      product: 'Petrol',
      quantity: '7 Litres',
        dateTime: '15, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'NNPC',
      product: 'Diesel',
      quantity: '20 Litres',
        dateTime: '19, july, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'NNPC',
      product: 'Petrol',
      quantity: '3 Litres',
        dateTime: '26, October, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'Mobil',
      product: 'Petrol',
      quantity: '30 Litres',
        dateTime: '3, May, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'Mobil',
      product: 'Petrol',
      quantity: '5 Litres',
        dateTime: '29, March, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'Tonimas',
      product: 'Petrol',
      quantity: '9 Litres',
        dateTime: '2, August, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'NNPC',
      product: 'Petrol',
      quantity: '11 Litres',
        dateTime: '1, january, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
      title: 'NNPC',
      product: 'Diesel',
      quantity: '25 Litres',
        dateTime: '15, Febuary, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Loyalty Point Balance',
        product: 'Diesel',
        quantity: '25 Litres',
        dateTime: '10, Febuary, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'NNPC',
        product: 'Petrol',
        quantity: '19 Litres',
        dateTime: '13, january, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Zaco Oils',
        product: 'Petrol',
        quantity: '11 Litres',
        dateTime: '1, january, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Tonimas',
        product: 'Diesel',
        quantity: '20 Litres',
        dateTime: '19, july, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Bonimas',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '15, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Tonimas',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '15, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Tonimas',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '15, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Tonimas',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '15, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Zaco Oils',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '15, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Zaco Oils',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '5, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Zaco Oils',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '1, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
    PreviousOrderData(
        title: 'Zaco Oils',
        product: 'Petrol',
        quantity: '10 Litres',
        dateTime: '13, April, 2021',
        address: '12, Umuatako, aba, Abia State'
    ),
  ];

  Widget confirmationDialog(BuildContext context, String? title, String? product, String? quantity, String? address){
    return Dialog(
      elevation: 10,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(title!, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Lato', color: AppTheme.grey.withOpacity(0.5)),),
              ],),
              SizedBox(height: 12,),
              CustomReadOnlyFormField(
                height: 48,
                backgroundColor: AppTheme.grey.withOpacity(0.2),
                initialValue: product!,
                  validator: (value){}
              ),
              SizedBox(height: 27,),
              CustomReadOnlyFormField(
                  height: 48,
                  backgroundColor: AppTheme.grey.withOpacity(0.2),
                  initialValue: quantity!,
                  validator: (value){}
              ),
              SizedBox(height: 27,),
              CustomReadOnlyFormField(
                  height: 48,
                  backgroundColor: AppTheme.grey.withOpacity(0.2),
                  initialValue: address,
                  validator: (value){}
              ),
              SizedBox(height: 27,),
              CustomButton(
                decorationColor: AppTheme.dark_blue,
                buttonRadius: 20,
                buttonHeight: 37,
                  onPressed: (){},
                textColor: AppTheme.white,
                buttonWidth: 80,
                buttonText: 'proceed',
                labelFontSize: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget previousOrderListView() {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: previousOrderData.length,
          itemBuilder: (BuildContext context, int index) =>
              InkWell(
                onTap: (){
                  changeScreen(context, PlaceYourOrder(address: previousOrderData[index].address!, title: previousOrderData[index].title!, product: previousOrderData[index].product!,quantity: previousOrderData[index].quantity!,));
                  //confirmationDialog(previousOrderData[index].title!, previousOrderData[index].product!, previousOrderData[index].quantity!, previousOrderData[index].address!);
                },
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(previousOrderData[index].title!, style: TextStyle(fontFamily: "Lato", fontSize: 16,fontWeight: FontWeight.w500, color: AppTheme.dark_blue),),
                              Text(previousOrderData[index].product!, style: TextStyle(fontFamily: "Lato", fontSize: 12,fontWeight: FontWeight.w500, color: AppTheme.grey.withOpacity(0.5)),),
                            ],
                          ),
                          Text(previousOrderData[index].quantity!, style: TextStyle(fontFamily: "Lato", fontSize: 12,fontWeight: FontWeight.w500, color: AppTheme.grey.withOpacity(0.5)),),
                          Text(previousOrderData[index].dateTime!, style: TextStyle(fontFamily: "Lato", fontSize: 12,fontWeight: FontWeight.w500, color: AppTheme.grey.withOpacity(0.5)),)
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
        )
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Text('Select previous delivery', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),)),
                  ),
                ],
              )
            ),
          ),
          body: previousOrderListView(),
        )
    );
  }
}
