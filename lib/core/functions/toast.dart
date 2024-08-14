import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toast({String msg = 'تم نسخ النص'}) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      fontSize: 16.0,
    );
