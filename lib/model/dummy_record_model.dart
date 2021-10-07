import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class Record {
  Record({
    this.title,
    this.date,
    this.time,
    this.amount,
    this.amountColor,
    this.titleColor
  });

  String? title;
  String? date;
  String? amount;
  String? time;
  Color? amountColor;
  Color? titleColor;

  static List<Record> records = <Record>[
    Record(
      time: '9:00 am',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.green,
      titleColor: Colors.green,
    ),
    Record(
      time: '12:00 am',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
      titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '08:30 am',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '11:37 am',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '2:00 pm',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '2:34 pm',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
    ),
    Record(
      time: '3:15 pm',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.green,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '5: 37 pm',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.green,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '12:00 am',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '4:57 pm',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time: '5:13 pm',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
        titleColor: AppTheme.dark_blue
    ),
    Record(
      time:'11:00 am',
      title: 'Zaco Oil',
      date: "13th Sept, 2021",
      amount: '-200,000',
      amountColor: Colors.red,
        titleColor: AppTheme.dark_blue
    ),
  ];}