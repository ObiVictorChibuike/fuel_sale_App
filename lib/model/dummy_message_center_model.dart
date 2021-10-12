import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class MessageCenter {
  final String? title;
  final String? deliveryStatus;
  final String? deliveryTime;
  final Colors? color;

  MessageCenter({this.title, this.deliveryStatus, this.deliveryTime, this.color});

  static List<MessageCenter> messageCenterModel = <MessageCenter>[
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '30 mins ago',
    ),
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '40 mins ago',
    ),
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '38 mins ago',
    ),
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '20 mins ago',
    ),
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '60 mins ago',
    ),
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '19 mins ago',
    ),
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '3 mins ago',
    ),
    MessageCenter(
      title: 'Message Center',
      deliveryStatus: 'Your delivery is now completed',
      deliveryTime: '38 mins ago',
    ),
  ];
}