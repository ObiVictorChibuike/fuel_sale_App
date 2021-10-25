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

  _buildDialog (BuildContext context, String title, String address, String product, String quantity) => showDialog(context: context, builder: (BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height / 2.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      height: 30,
                        child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Lato', color: AppTheme.dark_blue),)),
                  ),
                 CustomReadOnlyFormField(
                   initialValue: address,
                   focusedBorderColor: Colors.transparent,
                   enabledBorderColor: Colors.transparent,
                   elevation: 0,
                   height: 45,
                     backgroundColor: AppTheme.grey.withOpacity(0.1),
                     ),
                  SizedBox(height: 15,),
                  CustomReadOnlyFormField(
                    initialValue: product,
                    focusedBorderColor: Colors.transparent,
                    enabledBorderColor: Colors.transparent,
                    elevation: 0,
                    height: 45,
                    backgroundColor: AppTheme.grey.withOpacity(0.1),
                  ),
                  SizedBox(height: 15,),
                  CustomReadOnlyFormField(
                    initialValue: '$quantity',
                    focusedBorderColor: Colors.transparent,
                    enabledBorderColor: Colors.transparent,
                    elevation: 0,
                    height: 45,
                    backgroundColor: AppTheme.grey.withOpacity(0.1),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 45,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: CustomButton(
                            borderColor: AppTheme.dark_blue,
                            labelFontSize: 12,
                            buttonWidth: MediaQuery.of(context).size.width,
                            buttonHeight: 32,
                            decorationColor: AppTheme.dark_blue,
                            buttonRadius: 20,
                            textColor: AppTheme.white,
                            buttonText: 'Proceed',
                            onPressed: (){
                              changeScreen(context, PlaceYourOrder(title: title, address: address, product: product, quantity: quantity,));
                            }
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );}
  );

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

  Widget previousOrderListView() {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: previousOrderData.length,
          itemBuilder: (BuildContext context, int index) =>
              InkWell(
                onTap: (){
                  _buildDialog(context, previousOrderData[index].title!, previousOrderData[index].address!, previousOrderData[index].product!, previousOrderData[index].quantity!);
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
