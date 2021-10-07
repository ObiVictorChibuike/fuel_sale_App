
class ButtonText{
  final String? buttonText;
  ButtonText({this.buttonText});

  static List<ButtonText> buttonTextLabel = <ButtonText>[
    ButtonText(
      buttonText: "All"
    ),
    ButtonText(
        buttonText: "Expenses"
    ),
    ButtonText(
        buttonText: "Credits"
    ),
  ];
}