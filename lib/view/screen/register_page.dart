import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:opportunity_app/core/constants/app_colors.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';
import 'package:opportunity_app/view/widget/drop_down.dart';
import 'package:opportunity_app/view/widget/text_field.dart';

import '../../core/constants/app_images.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            AppImages.authShape,
            height: context.height / 6,
            color: AppColors.myDarkBlue,
          ).align(alignment: const Alignment(-1, -1)),
          Transform.rotate(
            angle: -pi,
            child: Image.asset(
              AppImages.authShape,
              height: context.height / 12,
              color: AppColors.myDarkBlue,
            ).align(alignment: const Alignment(-1, -1)),
          ),
          // Form(
          // key: GlobalKey<FormState>(),
          // child:
          ListView(
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: AppColors.myDarkBlue,
                ),
              ).center().paddingOnly(top: 90, bottom: 30),
              CustomTextField(
                title: 'Name',
                hint: 'enter your name',
                textEditingController: TextEditingController(),
                validator: (String? value) => null,
              ),
              CustomTextField(
                title: 'Email',
                hint: 'Someone@email.com',
                textEditingController: TextEditingController(),
                textInputType: TextInputType.emailAddress,
                validator: (String? value) => null,
              ),
              const CustomDropDown(
                title: 'Role',
                currentSelected: 'USER',
                list: [
                  'USER',
                  'ADMIN',
                ],
              ),
              // _buildRoleDropDown(context),
              // SizedBox(
              //   height: 10,
              // ),
              // _buildPhoneEntryFiled(context, 'Phone Number', '+963...'),
              // SizedBox(
              //   height: 10,
              // ),
              // _buildPasswordEntryFiled(
              //     context, 'Password', 'Enter your password'),
              // SizedBox(
              //   height: 50,
              // ),
              // _submitButton(context),
              // _loginAccountLabel()
            ],
          ).paddingSymmetric(horizontal: 15),
          // ),
        ],
      ),
    ).makeSafeArea();
  }

//   Widget _submitButton(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         width: currentWidth! * 0.7,
//         padding: EdgeInsets.symmetric(vertical: 15),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   color: Colors.grey.shade200,
//                   offset: Offset(2, 4),
//                   blurRadius: 5,
//                   spreadRadius: 2)
//             ],
//             gradient: LinearGradient(
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 colors: [
//                   Colors.blue[400]!,
//                   Colors.blue[300]!,
//                   Colors.blue[200]!,
//                   Colors.blue[100]!
//                 ])),
//         child: Text(
//           'Sign Up',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//       ),
//       onTap: () async {
//         if (validate()) {
//           EasyLoading.show(status: 'Loading');
//           try {
//             var loadingStatus = await registerController.register();
//             if (loadingStatus == true) {
//               EasyLoading.showSuccess("Sign up success");
//               Get.to(LoginPage());
//             }
//           } catch (e) {
//             EasyLoading.showError("Error: $e");
//           }
//         }
//       },
//     );
//   }
//

//

//   Widget _buildPasswordEntryFiled(
//     BuildContext context,
//     String title,
//     String hintText,
//   ) {
//     return Container(
//       width: currentWidth! * 0.9,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: registerController.passwordController,
//             obscureText: !showPassword.value,
//             decoration: InputDecoration(
//               hintText: hintText,
//               hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
//               border: InputBorder.none,
//               fillColor: Color(0xfff3f3f4),
//               filled: true,
//               suffixIcon: showPassword.value
//                   ? IconButton(
//                       icon: Icon(Icons.visibility),
//                       onPressed: () {
//                         showPassword.toggle();
//                       },
//                     )
//                   : IconButton(
//                       icon: Icon(Icons.visibility_off),
//                       onPressed: () {
//                         showPassword.toggle();
//                       },
//                     ),
//             ),
//             keyboardType: TextInputType.visiblePassword,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter a password';
//               }
//               // Add your password validation logic here
//               // For example, you can check for minimum length, presence of uppercase, lowercase, and numbers
//               if (value.length < 8) {
//                 return 'Password must be at least 8 characters long';
//               }
//
//               if (!RegExp(r'[a-z]').hasMatch(value)) {
//                 return 'Password must contain at least one lowercase letter';
//               }
//               if (!RegExp(r'[0-9]').hasMatch(value)) {
//                 return 'Password must contain at least one number';
//               }
//               return null;
//             },
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           // Password strength indicator
//
//           // Password requirements
//           Text(
//             'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number.',
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget _loginAccountLabel() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Already have an account? ',
//             style: TextStyle(fontSize: 12, color: Colors.black),
//           ),
//           InkWell(
//             child: Text(
//               'Login',
//               style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold),
//             ),
//             onTap: () => Get.toNamed('/login'),
//           )
//         ],
//       ),
//     );
//   }
}
