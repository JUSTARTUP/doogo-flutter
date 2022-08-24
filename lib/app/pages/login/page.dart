import 'package:firebase_getx_boilerplate/app/core/theme/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/theme/text_theme.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/controller.dart';
import 'package:firebase_getx_boilerplate/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginPageController controller = Get.find<LoginPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: const [
                Text("Doogo", style: AppTextTheme.bold28),
                SizedBox(height: 20),
                Text("설며엉ㄹ미너댖러이ㅏ너ㅐㅈ댜러ㅑㅣ덛재렂먀ㅐㄷ", style: AppTextTheme.regular16),
              ],
            ),
            Image.asset("assets/images/empty_box.png"),
            Column(children: [
              FGBPLoginButton(
                imgUrl: "assets/images/google.png",
                title: "Log in with Google",
                color: AppColorTheme.white,
                textColor: AppColorTheme.grey,
                onTap: () {
                  controller.loginWithGoogle();
                },
              ),
              const SizedBox(height: 8),
              FGBPLoginButton(
                imgUrl: "assets/images/apple.png",
                title: "Log in with Apple",
                textColor: AppColorTheme.white,
                onTap: () {
                  controller.loginWithApple();
                },
              ),
            ])
          ],
        ),
      )),
    );
  }
}
