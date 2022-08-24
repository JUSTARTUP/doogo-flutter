import 'package:Doogo/app/core/theme/color_theme.dart';
import 'package:Doogo/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class FGBPTextField extends StatelessWidget {
  const FGBPTextField(
      {Key? key,
      required this.textController,
      this.hintText,
      this.inputType = TextInputType.none,
      this.borderColor = AppColorTheme.mainColor})
      : super(key: key);

  final TextEditingController textController;
  final String? hintText;
  final TextInputType? inputType;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      controller: textController,
      style: AppTextTheme.regular20,
      cursorColor: AppColorTheme.black,
      decoration: InputDecoration(
        hintStyle: AppTextTheme.regularGrey14,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        fillColor: AppColorTheme.white,
        filled: true,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        focusColor: AppColorTheme.mainColor,
      ),
    );
  }
}
