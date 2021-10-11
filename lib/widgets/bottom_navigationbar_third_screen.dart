import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/previous-order.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomNavigationBarThirdScreen extends StatefulWidget {
  final bool? isDelivery;
  const BottomNavigationBarThirdScreen({Key? key, this.isDelivery}) : super(key: key);

  @override
  _BottomNavigationBarThirdScreenState createState() => _BottomNavigationBarThirdScreenState();
}

class _BottomNavigationBarThirdScreenState extends State<BottomNavigationBarThirdScreen> {



  static final LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);
  static final CameraPosition _kInitialPosition = CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  Widget isDeliveryFalseUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 80,),
          Container(
            width: double.maxFinite,
            height: 45,
            decoration: BoxDecoration(
              color: AppTheme.dark_blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, top: 10, bottom: 11, right: 0.0),
                  child: Text('Order', style: TextStyle(color: AppTheme.white, fontSize: 18, fontFamily: 'Lato'),),
                ),
                SizedBox(width: 112,),
                Container(
                  height: 31,
                  width: 0.5,
                  color: AppTheme.blue,
                ),
                SizedBox(width: 20,),
                Chip(
                  backgroundColor: AppTheme.dark_blue.withOpacity(0.5),
                  label: Text('Now'),
                  avatar: Icon(Icons.access_time),
                  deleteIcon: Icon(Icons.arrow_drop_down_outlined),
                  deleteIconColor: AppTheme.white,
                )
              ],
            ),
          ),
          SizedBox(height: 33,),
          InkWell(
            onTap: (){
              changeScreen(context, PreviousOrder());
            },
            child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.maxFinite,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.access_time, color: AppTheme.dark_blue,),
                    Text('Repeat previous deliveries', style: TextStyle(fontFamily: 'Lato', fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.dark_blue),),
                    Icon(Icons.arrow_forward_ios, size: 15, color: AppTheme.dark_blue)
                  ],
                )
            ),
          ),
          SizedBox(height: 21,),
          Container(
            width: double.maxFinite,
            height: 336,
            child: GoogleMap(
              initialCameraPosition: _kInitialPosition,
            ),
          ),
        ],
      ),
    );
  }

  Widget isDeliveryTrueUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 24,),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Deliver Status', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24, fontFamily: 'Lato', color: AppTheme.white),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('1500ltrs', style: TextStyle(fontFamily: 'Lato', fontSize: 13, fontWeight: FontWeight.w300, color: AppTheme.white),),
                    Text('Zaco Oils', style: TextStyle(fontFamily: 'Lato', fontSize: 13, fontWeight: FontWeight.w300, color: AppTheme.white),),
                    Text('Delivery now', style: TextStyle(fontFamily: 'Lato', fontSize: 13, fontWeight: FontWeight.w300, color: AppTheme.white),),
                  ],
                )
              ],
            ),
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.dark_blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 29,),
          Text('Hello Daniel!', style: TextStyle(fontFamily: 'Lato', fontSize: 24, fontWeight: FontWeight.w100, color: AppTheme.dark_blue),),
          SizedBox(height: 26,),
          Container(
            width: double.maxFinite,
            height: 45,
            decoration: BoxDecoration(
              color: AppTheme.dark_blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, top: 10, bottom: 11, right: 0.0),
                  child: Text('Order', style: TextStyle(color: AppTheme.white, fontSize: 18, fontFamily: 'Lato'),),
                ),
                SizedBox(width: 112,),
                Container(
                  height: 31,
                  width: 0.5,
                  color: AppTheme.blue,
                ),
                SizedBox(width: 20,),
                Chip(
                  backgroundColor: AppTheme.dark_blue.withOpacity(0.5),
                  label: Text('Now'),
                  avatar: Icon(Icons.access_time),
                  deleteIcon: Icon(Icons.arrow_drop_down_outlined),
                  deleteIconColor: AppTheme.white,
                )
              ],
            ),
          ),
          SizedBox(height: 33,),
          InkWell(
            onTap: (){
              changeScreen(context, PreviousOrder());
            },
            child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.maxFinite,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.access_time, color: AppTheme.dark_blue,),
                    Text('Repeat previous deliveries', style: TextStyle(fontFamily: 'Lato', fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.dark_blue),),
                    Icon(Icons.arrow_forward_ios, size: 15, color: AppTheme.dark_blue)
                  ],
                )
            ),
          ),
          SizedBox(height: 57,),
          Container(
            width: double.maxFinite,
            height: 162,
            child: GoogleMap(
              initialCameraPosition: _kInitialPosition,
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
          backgroundColor: AppTheme.backGround,
          appBar: AppBar(
            backgroundColor: AppTheme.backGround,
            elevation: 0.0,
            leading: widget.isDelivery == true ? Icon(Icons.menu, color: AppTheme.dark_blue,) : IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios, color: AppTheme.dark_blue,)),
          ),
          body: isDeliveryTrueUI(),
        )
    );
  }
}
