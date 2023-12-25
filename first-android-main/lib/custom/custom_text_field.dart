import "package:flutter/material.dart";
import "package:flutter_login/custom/style.dart";

// ignore: camel_case_types
class CusTom_TextField extends StatefulWidget {
  const CusTom_TextField({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.callback,
  });

  final double width;
  final String title;
  final String value;
  final Function(String output) callback;
  @override
  State<CusTom_TextField> createState() => _CusTom_TextFieldState();
}

// ignore: camel_case_types
class _CusTom_TextFieldState extends State<CusTom_TextField> {
  int status = 0;
  String output = "";
  @override
  void initState() {
    output = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              color: Color.fromARGB(255, 31, 0, 116),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        status == 0
            ? InkWell(
                onTap: () {
                  setState(() {
                    status = 1;
                  });
                },
                child: Text(
                  widget.value == "" ? "Không có" : widget.value,
                  style: StyleGlobal.h4,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 201, 197, 197),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: widget.width - 70,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      initialValue: output,
                      onChanged: (value) {
                        setState(() {
                          output = value;
                        });
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        status = 0;
                        widget.callback(output);
                      });
                    },
                    child: const Icon(
                      Icons.save,
                      size: 20,
                    ),
                  )
                ],
              ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
