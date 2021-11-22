import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/app_navigation.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/screens/place_your_order.dart';
import 'package:fuel_sale_app/screens/previous-order.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'custom_button.dart';

class BottomNavigationBarThirdScreen extends StatefulWidget {
  final Position position;
  final String token;
  BottomNavigationBarThirdScreen({Key? key, required this.position, required this.token}) : super(key: key);

  @override
  _BottomNavigationBarThirdScreenState createState() =>
      _BottomNavigationBarThirdScreenState();
}

class _BottomNavigationBarThirdScreenState extends State<BottomNavigationBarThirdScreen> {

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      confirmText: "Confirm",
      cancelText: "Cancel",
      helpText: "Ok",
    );
    if(picked != null && picked != selectedTime)
    {
      setState(() {
        selectedTime = picked;
      });
    }
  }


  @override
  void initState() {
    super.initState();
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
        initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select Date',
        cancelText: 'Cancel',
        confirmText: 'Ok',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  _buildDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: Dialog(
            child: Container(height: MediaQuery.of(context).size.height / 3.8, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(height: 50, width: MediaQuery.of(context).size.width, color: AppTheme.grey.withOpacity(0.1)),
                    Container(height: 1, width: MediaQuery.of(context).size.width, color: AppTheme.grey.withOpacity(0.3)),
                    Container(
                      height: 50, width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: ()=>_selectDate(context),
                        child: Center(
                            child: Text(
                          "${selectedDate.toLocal()}".split(" ")[0],
                          style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w400, fontFamily: 'Nunito', color: AppTheme.dark_blue),)),),),
                    Container(height: 1, width: MediaQuery.of(context).size.width, color: AppTheme.grey.withOpacity(0.3),),
                    Container(
                      height: 50, width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: (){_selectTime(context);},
                        child: Center(
                            child: Text("${selectedTime.hour}:${selectedTime.minute}", style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w400, fontFamily: 'Nunito', color: AppTheme.dark_blue),)),),),
                    Container(
                      height: 1, width: MediaQuery.of(context).size.width, color: AppTheme.grey.withOpacity(0.3),),
                    Container(
                      height: 50,
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
                              buttonText: 'Set delivery time',
                              onPressed: () {
                                changeScreen(context, PlaceYourOrder(token: widget.token));
                              }),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        );
      });



  Set<Marker> _createMaker(LatLng _kMapCenter){
    return <Marker>[
      Marker(markerId: MarkerId("home"), position: _kMapCenter,
        icon: BitmapDescriptor.defaultMarker,infoWindow: InfoWindow(title: "Home"),),
    ].toSet();
  }

  // static final LatLng _kMapCenter =
  //     LatLng(position!.longitude, 72.84793849278007);
  // static final CameraPosition _kInitialPosition =
  //     CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  Widget isDeliveryFalseUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 80,),
          Container(
            width: double.maxFinite, height: 45,
            decoration: BoxDecoration(color: AppTheme.dark_blue, borderRadius: BorderRadius.circular(5),),
            child: Row(
              children: [
                Padding(padding: const EdgeInsets.only(left: 26.0, top: 10, bottom: 11, right: 0.0),
                  child: Text('Order', style: TextStyle(color: AppTheme.white, fontSize: 18, fontFamily: 'Nunito'),),),
                SizedBox(width: 112,),
                Container(height: 31, width: 0.5, color: AppTheme.blue,),
                SizedBox(
                  width: 20,
                ),
                Chip(
                  labelStyle: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppTheme.white),
                  backgroundColor: AppTheme.dark_blue.withOpacity(0.5),
                  label: Text('Now'),
                  avatar: Icon(
                    Icons.access_time,
                    color: AppTheme.white,
                  ),
                  deleteIcon: Icon(
                    Icons.arrow_drop_down_outlined,
                  ),
                  deleteIconColor: AppTheme.white,
                  onDeleted: () {
                    _buildDialog(context);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 33,
          ),
          InkWell(
            onTap: () {
              changeScreen(context, PreviousOrder());
            },
            child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(5),
                ), width: double.maxFinite, height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppTheme.dark_blue,
                    ),
                    Text(
                      'Repeat previous deliveries',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.dark_blue),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 15, color: AppTheme.dark_blue)
                  ],
                )),
          ),
          SizedBox(
            height: 21,
          ),
          Container(
            width: double.maxFinite,
            height: 336,
            child: GoogleMap(
              markers: _createMaker(LatLng(widget.position.longitude, widget.position.latitude)),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(target: LatLng(widget.position.longitude, widget.position.latitude), zoom: 11.0, tilt: 0, bearing: 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget isDeliveryTrueUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Deliver Status',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 24,
                      fontFamily: 'Nunito',
                      color: AppTheme.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '1500ltrs',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: AppTheme.white),
                    ),
                    Text(
                      'Zaco Oils',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: AppTheme.white),
                    ),
                    Text(
                      'Delivery now',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: AppTheme.white),
                    ),
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
          SizedBox(
            height: 29,
          ),
          Text(
            'Hello Daniel!',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 24,
                fontWeight: FontWeight.w100,
                color: AppTheme.dark_blue),
          ),
          SizedBox(
            height: 26,
          ),
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
                  padding: const EdgeInsets.only(
                      left: 26.0, top: 10, bottom: 11, right: 0.0),
                  child: Text(
                    'Order',
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 18,
                        fontFamily: 'Nunito'),
                  ),
                ),
                SizedBox(
                  width: 190,
                ),
                Container(
                  height: 31,
                  width: 0.5,
                  color: AppTheme.blue,
                ),
                SizedBox(
                  width: 60,
                ),
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
          SizedBox(
            height: 33,
          ),
          InkWell(
            onTap: () {
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
                    Icon(
                      Icons.access_time,
                      color: AppTheme.dark_blue,
                    ),
                    Text(
                      'Repeat previous deliveries',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.dark_blue),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 15, color: AppTheme.dark_blue)
                  ],
                )),
          ),
          SizedBox(
            height: 57,
          ),
          Container(
            width: double.maxFinite,
            height: 162,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: LatLng(widget.position.longitude, widget.position.latitude), zoom: 11.0, tilt: 0, bearing: 0),
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
          body: isDeliveryFalseUI(),
        ));
  }
}
