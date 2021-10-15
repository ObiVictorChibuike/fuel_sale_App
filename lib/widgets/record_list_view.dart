import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class ButtonFilter extends StatefulWidget {
  const ButtonFilter({Key? key}) : super(key: key);

  @override
  _ButtonFilterState createState() => _ButtonFilterState();
}

class _ButtonFilterState extends State<ButtonFilter> {
  int _selectedIndex = 0;
  List<String> filters = [
    'All',
    'Expenses',
    'Credit',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
        itemCount: filters.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: filters.length, childAspectRatio: 2.5),
        itemBuilder: (context, index) => buildFilter(index),
    );
  }
  Widget buildFilter (int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70.0,
            height: MediaQuery.of(context).size.width / 11,
            decoration: BoxDecoration(
              color: _selectedIndex == index ? AppTheme.blue : AppTheme.grey.withOpacity(0.2),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border(top: BorderSide(width: 1.0, color: Colors.transparent),
                bottom: BorderSide(width: 1.0, color: Colors.transparent),
                left: BorderSide(width: 1.0, color: Colors.transparent),
                right: BorderSide(width: 1.0, color: Colors.transparent),
              ),
            ),
            child: Center(child: Text(filters[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 13, fontFamily: 'Nunito', fontWeight: FontWeight.w400, color: _selectedIndex == index ? AppTheme.white : AppTheme.blue),)),
          )
        ],
      ),
    );
  }
}