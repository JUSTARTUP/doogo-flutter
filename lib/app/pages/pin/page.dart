import 'package:Doogo/app/core/theme/text_theme.dart';
import 'package:Doogo/app/pages/pin/controller.dart';
import 'package:Doogo/app/routes/route.dart';
import 'package:Doogo/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinValidationPage extends StatelessWidget {
  PinValidationPage({Key? key}) : super(key: key);

  final PinValidationPageController controller =
      Get.find<PinValidationPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("SMS으로 인증", style: AppTextTheme.bold20),
                  SizedBox(height: 16),
                  Text("010-36**-**46으로 보낸 6자리 코드를 입력해주세요",
                      style: AppTextTheme.regular16),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: PinCodeTextField(
                        autoFocus: true,
                        controller: controller.pinController,
                        appContext: context,
                        length: 6,
                        onChanged: (_) {},
                        onCompleted: (_) {
                          controller.checkPin();
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeColor: Colors.blue,
                            inactiveColor: Colors.grey),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
