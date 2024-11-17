import 'package:exam_adv_flutter/controller/contact_controller.dart';
import 'package:exam_adv_flutter/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Sign - In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.txtEmail,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.txtPassword,
              decoration: const InputDecoration(
                  labelText: 'password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthService.authService.signInWithUserEmailAndPassword(
                    controller.txtEmail.text, controller.txtPassword.text);
                  controller.txtEmail.clear();
                  controller.txtPassword.clear();
                Get.toNamed('/home');
              },
              child: const Text('sign-in'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/sign-Up');
              },
              child: const Text('Dont` have a account ? sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}
