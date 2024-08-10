import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({
    Key? key,
    required this.width,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final String text;
  final IconData icon;
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
            Icon(
              icon,
              size: 20,
              color: AppColors.verLightBlue,
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.verLightBlue,
              ),
            ),
          ],
        ).paddingAll(4),
      ),
    );
  }
}
