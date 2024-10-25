import 'package:exam_adv_flutter/controller/contact_controller.dart';
import 'package:exam_adv_flutter/service/auth_service/authThentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.txtEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.txtPassword,
              decoration: const InputDecoration(
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if(controller.txtPassword.text==controller.txtConfirmPassword.text)
                    {
                      String? response = await AuthService.authService.signInWithEmailAndPassword(
                          controller.txtEmail.text, controller.txtPassword.text);

                      User?  user = await AuthService.authService.getCurrentUser();
                      if(user!=null && response == 'success')
                        {
                          Get.offAndToNamed('/home');
                        }
                       Get.toNamed('/home');
                    }
                },
                child: const Text(
                  'Sign-In',
                  style: TextStyle(color: Colors.blue),
                )),
            TextButton(
                onPressed: ()  {

                  Get.toNamed('/sign-Up');
                },
                child: const Text(
                  'Don`t have account? Sign-Up',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
