import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class CusTom_ButtonSubmit extends StatelessWidget {
  CusTom_ButtonSubmit({
    super.key,
    required this.textButton,
    this.isEnabled = true,
    this.size = 24,
  });
  final String textButton;
  // ignore: prefer_typing_uninitialized_variables
  var size;

  // ignore: prefer_typing_uninitialized_variables
  var isEnabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        color: isEnabled ? Color.fromARGB(255, 9, 203, 247) : Colors.grey[400],
      ),
      child: Text(
        textButton,
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: size,
            color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
