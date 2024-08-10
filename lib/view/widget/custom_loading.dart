import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.1),
      child: Container(
        height: 100,
        width: 100,
        color: Colors.black.withOpacity(0.5),
        child: const SpinKitCubeGrid(
          color: AppColors.myDarkBlue,
        ),
      ).center(),
    );
  }
}
