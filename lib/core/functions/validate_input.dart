import 'package:get/get.dart';

import '../enums/input_status.dart';

validateInput({required String input, required InputStatus inputStatus}) {
  return input.isEmpty
      ? "Empty context"
      : switch (inputStatus) {
          InputStatus.none => input.length < 2 ? 'invalid input' : null,
          InputStatus.email =>
            !GetUtils.isEmail(input) ? 'invalid email' : null,
          InputStatus.password =>
            !RegExp(r'^(?=.*\d)(?=.*[a-zA-Z])[A-Za-z\d]{8,}$').hasMatch(input)
                ? 'password must contains at least 8 (number and letter)'
                : null,
          InputStatus.phone => !RegExp(r'^\+963\d{9}$').hasMatch(input)
              ? 'invalid phone number'
              : null,
        };
}
