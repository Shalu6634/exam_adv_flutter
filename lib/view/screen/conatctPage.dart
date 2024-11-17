import 'package:exam_adv_flutter/controller/contact_controller.dart';
import 'package:exam_adv_flutter/controller/firebase_controller.dart';
import 'package:exam_adv_flutter/service/auth_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DbController());
    var fbController = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            await AuthService.authService.logOut();
            Get.toNamed('/sign-In');
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Contact Page',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () async {

                // await controller.syncCloudToLocal();
              },
              icon: const Icon(
                Icons.sync,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.backup,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(
                  '${controller.data[index]['name']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: Text(
                  controller.data[index]['phone'].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.deleteDetail(controller.data[index]['id']);
                          print('---------------------------------');
                          print(controller.data[index]['id']);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        )),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Update Contact'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: controller.txtName,
                                  decoration: const InputDecoration(
                                      labelText: 'name',
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: controller.txtPhone,
                                  decoration: const InputDecoration(
                                      labelText: 'phoneNumber',
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: controller.txtEmail,
                                  decoration: const InputDecoration(
                                      labelText: 'email',
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder()),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('cancel')),
                              TextButton(
                                onPressed: () {
                                  controller.updateDetail(
                                      controller.txtName.text,
                                      controller.txtPhone.text,
                                      controller.txtEmail.text,
                                      controller.data[index]['id']);
                                  Get.back();
                                },
                                child: const Text('save'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Contact'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: controller.txtName,
                    decoration: const InputDecoration(
                        labelText: 'name',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: controller.txtPhone,
                    decoration: const InputDecoration(
                        labelText: 'phoneNumber',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: controller.txtEmail,
                    decoration: const InputDecoration(
                        labelText: 'email',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('cancel')),
                TextButton(
                  onPressed: () {
                    controller.insertData(controller.txtName.text,
                        controller.txtPhone.text, controller.txtEmail.text);
                    Get.back();
                    controller.txtEmail.clear();
                    controller.txtPhone.clear();
                    controller.txtName.clear();
                  },
                  child: const Text('save'),
                ),
              ],
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
