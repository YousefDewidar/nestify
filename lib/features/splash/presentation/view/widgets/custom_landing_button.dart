import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';

class CustomLandingButton extends StatelessWidget {
  const CustomLandingButton({
    super.key,
    required this.onTap,
    required this.text,
    this.onEnd,
    this.height,
    this.width, this.color, this.textColor,
  });
  final VoidCallback onTap;
  final String text;
  final Function()? onEnd;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        onEnd: onEnd,
        alignment: Alignment.center,
        height: height ?? 50,
        width: width ?? 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color:color?? Colors.white),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: textColor??AppColor.primaryColor),
        ),
      ),
    );
  }
}
