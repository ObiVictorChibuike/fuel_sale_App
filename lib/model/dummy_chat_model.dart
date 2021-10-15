import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fuel_sale_app/constant/color_palettes.dart';

class ChatModel{
  final String? name;
  final String? avatar;
  final String? msg;
  ChatModel({this.name, this.avatar, this.msg});
  static List<ChatModel> chatModel = <ChatModel>[
    ChatModel(
      name: 'Pascal Emetu',
      avatar: 'Pascal Emetu',
      msg: 'We have agreed to work with you',
    ),
    ChatModel(
      name: 'Destiny Ed',
      avatar: 'Destiny Ed',
      msg: 'We have agreed to work with you',
    ),
    ChatModel(
      name: 'Pascal Emetu',
      avatar: 'Pascal Emetu',
      msg: 'We have agreed to work with you',
    ),
    ChatModel(
      name: 'John Gabriel',
      avatar: 'John Gabriel',
      msg: 'We have agreed to work with you',
    ),
    ChatModel(
      name: 'Kalu Prosper',
      avatar: 'Kalu Prosper',
      msg: 'We have agreed to work with you',
    ),
  ];
}


class RandomColors{
  final Color? colors;

  RandomColors({this.colors});
  static List<RandomColors> randomColors = <RandomColors>[
    RandomColors(
      colors: Colors.red,
    ),
    RandomColors(
      colors: Colors.green,
    ),
    RandomColors(
      colors: Colors.yellow,
    ),
    RandomColors(
      colors: Colors.orange,
    ),
    RandomColors(
      colors: Colors.blue,
    ),
    RandomColors(
      colors: Colors.deepOrangeAccent,
    ),
    RandomColors(
      colors: Colors.brown,
    ),
    RandomColors(
      colors: Colors.deepPurple,
    ),
    RandomColors(
      colors: Colors.teal,
    ),
    RandomColors(
      colors: Colors.tealAccent,
    ),
    RandomColors(
      colors: AppTheme.dark_blue,
    ),
  ];
}