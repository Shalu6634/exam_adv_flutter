import 'package:exam_adv_flutter/controller/contact_controller.dart';
import 'package:exam_adv_flutter/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Sign - Up',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.txtName,
                decoration: const InputDecoration(
                    labelText: 'name',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.txtPhone,
                decoration: const InputDecoration(
                    labelText: 'phoneNumber',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.txtEmail,
                decoration: const InputDecoration(
                    labelText: 'email',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),  const SizedBox(
                height: 10,
              ),
          
              TextField(
                controller: controller.txtPassword,
                decoration: const InputDecoration(
                    labelText: 'password',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.txtComPassword,
                decoration: const InputDecoration(
                    labelText: 'Confirm password',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                 await AuthService.authService.createUserWithEmailAndPassword(controller.txtEmail.text,controller.txtPassword.text);
                 Get.toNamed('/sign-In');
                },
                child: const Text('sign-up'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/sign-In');
                },
                child: const Text('Already have account ? sign-in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
