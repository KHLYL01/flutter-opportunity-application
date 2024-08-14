import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.width,
    this.padding = 10,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final double padding;
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(vertical: padding),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: AppColors.myDarkBlue,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.myDarkBlue,
              ),
            ).paddingSymmetric(vertical: 10.0),
          ],
        ),
      ),
    );
  }
}
