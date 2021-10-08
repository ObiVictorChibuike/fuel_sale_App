import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';
import 'package:fuel_sale_app/model/dummy_record_model.dart';

class RecordListView extends StatefulWidget {
  const RecordListView({Key? key}) : super(key: key);

  @override
  _RecordListViewState createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Record.records.length,
        itemBuilder: (BuildContext context, int index) {
          return RecordView(record: Record.records[index],
          );
        }
    );
  }
}

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
    return Container(
      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
          itemCount: filters.length,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: filters.length),
          itemBuilder: (context, index) => buildFilter(index),
      ),
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


class RecordView extends StatelessWidget {
  final Record ? record;
  const RecordView({Key? key, this.record}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppTheme.grey.withOpacity(0.2),
        ),
        child: Row(
          children: [
            SizedBox(height: 9,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(record!.title.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 14, color: record!.titleColor),),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Text(record!.date.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 11, color: AppTheme.grey),),
                      Text(record!.time.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 11, color: AppTheme.grey),),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(record!.amount.toString(), style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Lato', fontSize: 14, color: record!.amountColor),),
            ),
          ],
        ),
      ),
    );
  }
}
