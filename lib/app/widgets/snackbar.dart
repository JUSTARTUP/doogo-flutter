import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FGBPSnackBar {
  static void open(String title) {
    Get.rawSnackbar(
      onTap: (_) {
        Get.back();
      },
      titleText: Text(title, style: AppTextTheme.boldWhite16),
      messageText: Container(),
      borderRadius: 12,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      isDismissible: true,
      backgroundColor: AppColorTheme.black,
    );
  }

  static void openOne(String title, String one) {
    Get.rawSnackbar(
      onTap: (_) {
        Get.back();
      },
      titleText: Text(title, style: AppTextTheme.bold20),
      messageText: Text(one, style: AppTextTheme.semiboldMain14),
      isDismissible: true,
      backgroundColor: AppColorTheme.white,
      mainButton: FGBPTextButton(
        text: "확인",
        radius: 10,
        onTap: () {
          Get.back();
        },
      ),
    );
  }

  static void openMany(String title, List<String> many) {
    Get.rawSnackbar(
      onTap: (_) {
        Get.back();
      },
      titleText: Text(title, style: AppTextTheme.bold20),
      messageText: Text.rich(
        TextSpan(children: [
          TextSpan(text: many[0], style: AppTextTheme.semiboldMain14),
          TextSpan(text: many[1], style: AppTextTheme.extraBold22),
          TextSpan(text: many[2], style: AppTextTheme.semiboldMain14),
        ]),
      ),
      isDismissible: true,
      backgroundColor: AppColorTheme.white,
      mainButton: FGBPTextButton(
        text: "확인",
        radius: 10,
        onTap: () {
          Get.back();
        },
      ),
    );
  }
}
