import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final VoidCallback buttonClick;
  final Color backgroundColor;
  final double radiusBorder;
  final double heightButton;
  final Widget? icon;

  const Button({
    Key? key,
    required this.title,
    required this.titleStyle,
    required this.buttonClick,
    this.backgroundColor = Colors.red,
    this.radiusBorder = 4.0,
    this.heightButton = 40,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        buttonClick.call();
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null)
              icon!,
              const SizedBox(width: 8,),
            Text(title, style: titleStyle,)
          ],
        ),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusBorder),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          fixedSize:
              MaterialStateProperty.all(Size(double.infinity, heightButton))),
    );
  }
}
