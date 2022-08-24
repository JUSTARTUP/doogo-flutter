import 'package:flutter/material.dart';

enum OptionType { unSelected, selected }

class Option extends StatelessWidget {
  const Option({Key? key, required this.value, this.iconData})
      : super(key: key);

  final String value;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    Widget addition = const SizedBox();

    if (iconData != null) {
      addition = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
        child: Icon(iconData),
      );
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            addition,
            Text(value),
          ],
        ),
      ),
    );
  }
}
