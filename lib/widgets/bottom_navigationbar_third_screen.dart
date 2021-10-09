import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/previous-order.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomNavigationBarThirdScreen extends StatefulWidget {
  const BottomNavigationBarThirdScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarThirdScreenState createState() => _BottomNavigationBarThirdScreenState();
}

class _BottomNavigationBarThirdScreenState extends State<BottomNavigationBarThirdScreen> {

  static final LatLng _kMapCenter =
  LatLng(19.018255973653343, 72.84793849278007);
  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

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
            leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios, color: AppTheme.dark_blue,)),
          ),
          body: Padding(
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
          ),
        )
    );
  }
}
