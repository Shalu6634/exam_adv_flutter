import 'package:exam_adv_flutter/views/auth/auth_manager.dart';
import 'package:exam_adv_flutter/views/auth/sign-in.dart';
import 'package:exam_adv_flutter/views/auth/sign-up.dart';
import 'package:exam_adv_flutter/views/contact_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
   getPages: [
     GetPage(name: '/', page: () => AuthManager(),),
     GetPage(name: '/sign-In', page: () => SignInScreen(),),
     GetPage(name: '/sign-Up', page: () => SignUpScreen(),),
     GetPage(name: '/home', page: () => ContactPage(),),

   ],
    );
  }
}
