import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios, color: AppTheme.dark_blue,)),
          ),
          body: Column(
            children: [

            ],
          ),
        )
    );
  }
}
