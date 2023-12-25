import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_login/custom/style.dart";
import "package:flutter_login/models/lop.dart";
import "package:flutter_login/models/place.dart";

// ignore: camel_case_types
class CusTom_DropDown extends StatefulWidget {
  const CusTom_DropDown({
    super.key,
    required this.width,
    required this.title,
    required this.valueId,
    required this.valueName,
    required this.callback,
    required this.list,
  });

  final double width;
  final String title;
  final int valueId;
  final String valueName;
  final List<Lop> list;
  final Function(int outputId, String outputName) callback;
  @override
  State<CusTom_DropDown> createState() => _CusTom_DropDownState();
}

// ignore: camel_case_types
class _CusTom_DropDownState extends State<CusTom_DropDown> {
  int status = 0;
  int outputId = 0;
  String outputName = "";
  @override
  void initState() {
    outputId = widget.valueId;
    outputName = widget.valueName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: StyleGlobal.h3,
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
                child: AutoSizeText(
                  outputName == "" ? "Không có" : outputName,
                  style: StyleGlobal.h4,
                  // overflow: TextOverflow.ellipsis,
                  // maxLines: 1,
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 197, 197),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: widget.width - 70,
                child: DropdownButton(
                  value: outputId,
                  items: widget.list
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: AutoSizeText(
                            e.ten,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      outputId = value!;
                      for (var item in widget.list) {
                        if (item.id == outputId) {
                          outputName = item.ten;
                          widget.callback(outputId, outputName);
                          break;
                        }
                      }
                      status = 0;
                    });
                  },
                ),
              ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class CusTom_DropDown_Place extends StatefulWidget {
  const CusTom_DropDown_Place({
    super.key,
    required this.width,
    required this.title,
    required this.valueId,
    required this.valueName,
    required this.callback,
    required this.list,
  });

  final double width;
  final String title;
  final int valueId;
  final String valueName;
  final List<Place> list;
  final Function(int outputId, String outputName) callback;
  @override
  State<CusTom_DropDown_Place> createState() => _CusTom_DropDown_PlaceState();
}

// ignore: camel_case_types, unused_element
class _CusTom_DropDown_PlaceState extends State<CusTom_DropDown_Place> {
  int status = 0;
  int outputId = 0;
  String outputName = "";
  @override
  void initState() {
    outputId = widget.valueId;
    outputName = widget.valueName;
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
                child: AutoSizeText(
                  outputName == "" ? "Không có" : outputName,
                  style: StyleGlobal.h4,
                  overflow: TextOverflow.clip,
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 197, 197),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: widget.width,
                child: DropdownButton(
                  value: widget.valueId,
                  items: widget.list
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: AutoSizeText(
                            e.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      outputId = value!;
                      for (var item in widget.list) {
                        if (item.id == outputId) {
                          outputName = item.name;
                          widget.callback(outputId, outputName);
                          break;
                        }
                      }
                      status = 0;
                    });
                  },
                ),
              ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
