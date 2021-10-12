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