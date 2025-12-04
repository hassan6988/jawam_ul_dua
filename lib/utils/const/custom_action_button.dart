import 'package:flutter/material.dart';
import 'package:jawam_ul_dua/utils/const/styles.dart';

import 'colors.dart';

class CustomActionButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final double? width;
  final bool isEnabled;
  final dynamic backgroundColor;
  final Color buttonTextColor;
  final TextStyle? buttonTextStyle;
  final Color? borderColor;
  final EdgeInsets margin;
  final double? height;
  final double borderRadius;

  const CustomActionButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width,
    this.isEnabled = true,
    this.backgroundColor = kAppGradient,
    this.buttonTextColor = kWhiteColor,
    this.buttonTextStyle,
    this.borderColor,
    this.margin = EdgeInsets.zero,
    this.height = 48,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: (backgroundColor is Color && isEnabled) ? backgroundColor : null,
        gradient: (backgroundColor is Gradient && isEnabled)
            ? backgroundColor
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: buttonTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          buttonText,
          style:
              buttonTextStyle ??
              AppStyles.w500f16poppins.copyWith(color: buttonTextColor),
        ),
      ),
    );
  }
}
