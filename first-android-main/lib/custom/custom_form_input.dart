import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class CusTom_Form_Input extends StatefulWidget {
  bool isValid;

  CusTom_Form_Input({
    super.key,
    required this.labelForm,
    required this.textController,
    required this.textError,
    required this.isValid,
    this.obs = false,
    this.isObs = false,
  });
  final String labelForm;
  final String textError;
  bool obs;
  TextEditingController textController = TextEditingController();

  bool isObs;
  @override
  State<CusTom_Form_Input> createState() => _Form_InputState();
}

// ignore: camel_case_types
class _Form_InputState extends State<CusTom_Form_Input> {
  @override
  Widget build(BuildContext context) {
    bool obsText = widget.obs;
    bool isObsText = widget.isObs;
    return TextField(
      obscureText: obsText,
      controller: widget.textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 16, 204, 247),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: widget.labelForm,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        errorText: widget.isValid ? widget.textError : null,
        errorStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: isObsText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obs = !widget.obs;
                  });
                },
                icon:
                    Icon(widget.obs ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
