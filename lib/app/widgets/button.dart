import 'package:Doogo/app/core/theme/color_theme.dart';
import 'package:Doogo/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

//Firbase_Getx_BoilerPlate...!
class FGBPButton extends StatelessWidget {
  const FGBPButton({
    Key? key,
    required this.child,
    this.color = AppColorTheme.mainColor,
    this.height,
    this.width,
    this.radius,
    this.onTap,
  }) : super(key: key);
  final Widget child;

  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius ?? 24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}

class FGBPTextButton extends StatelessWidget {
  const FGBPTextButton({
    Key? key,
    required this.text,
    this.height,
    this.color = AppColorTheme.mainColor,
    this.radius,
    this.onTap,
  }) : super(key: key);

  final String text;
  final double? height;
  final Color? color;
  final double? radius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const textColor = AppTextTheme.regular20;
    return FGBPButton(
      height: height,
      onTap: onTap,
      color: color,
      radius: radius,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: textColor,
          ),
        ),
      ),
    );
  }
}

class SmallFGBPButton extends StatelessWidget {
  const SmallFGBPButton(
      {Key? key,
      required this.child,
      this.height,
      this.color = AppColorTheme.mainColor,
      this.onTap})
      : super(key: key);

  final Widget child;
  final double? height;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FGBPButton(
      onTap: onTap,
      height: 48,
      radius: 16,
      child: child,
    );
  }
}

class FGBPLoginButton extends StatelessWidget {
  const FGBPLoginButton({
    Key? key,
    required this.imgUrl,
    required this.title,
    this.color = AppColorTheme.mainColor,
    this.textColor = AppColorTheme.mainColor,
    this.height,
    this.width,
    this.radius,
    this.onTap,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FGBPButton(
      color: color,
      height: height,
      width: width,
      onTap: onTap,
      radius: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgUrl),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
