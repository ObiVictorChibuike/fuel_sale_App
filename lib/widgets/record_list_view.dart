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
          return RecordView(
            record: Record.records[index],
          );
        }
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
