import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({
    Key? key,
    required this.width,
    required this.text,
    this.icon,
    this.onPressed,
    this.textFont = 16,
  }) : super(key: key);

  final double width;
  final String text;
  final double textFont;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.myDarkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(200, 42),
          padding: const EdgeInsets.all(10),
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 20,
                color: AppColors.verLightBlue,
              ),
            if (icon != null) const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: textFont,
                color: AppColors.verLightBlue,
              ),
            ),
          ],
        ).paddingAll(4),
      ),
    );
  }
}
