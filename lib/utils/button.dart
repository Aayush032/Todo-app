import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback isPressed;
  const MyButton({
    super.key,
    required this.buttonName,
    required this.isPressed,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isPressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonName, style: const TextStyle(fontSize: 20),),
      );
  }
}