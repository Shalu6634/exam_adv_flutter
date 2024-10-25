import 'package:exam_adv_flutter/service/auth_service/authThentication.dart';
import 'package:exam_adv_flutter/views/auth/sign-in.dart';
import 'package:exam_adv_flutter/views/contact_page.dart';
import 'package:flutter/material.dart';

class AuthManager extends StatelessWidget {
  const AuthManager({super.key});

  @override
  Widget build(BuildContext context) {
    return (AuthService.authService.getCurrentUser == null)
        ? SignInScreen()
        : ContactPage();
  }
}
