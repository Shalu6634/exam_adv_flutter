import 'package:exam_adv_flutter/controller/contact_controller.dart';
import 'package:exam_adv_flutter/service/auth_service/authThentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.txtName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.txtPhone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.txtEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 5,
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
                height: 5,
              ),
              TextField(
                controller: controller.txtConfirmPassword,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await AuthService.authService.createUserWithEmailAndPassword(
                        controller.txtEmail.text, controller.txtPassword.text);
                  },
                  child: const Text(
                    'Sign-Up',
                    style: TextStyle(color: Colors.blue),
                  )),
              TextButton(
                onPressed: () {
                  Get.toNamed('/sign-In');
                },
                child: const Text(
                  "Already have account? Sign-In",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
