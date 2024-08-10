import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bindings/initial_bindings.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  // await Firebase.initializeApp();
  // await FirebaseApi().initNotifications();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // prevent horizontal orientation
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 500),
      defaultTransition: Transition.fadeIn,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0c6780)),
        useMaterial3: true,
        fontFamily: GoogleFonts.cairo().fontFamily,
      ),
      getPages: routes,
      builder: EasyLoading.init(),
      initialBinding: InitialBindings(),
    );
  }
}
