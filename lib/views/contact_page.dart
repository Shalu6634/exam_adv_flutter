import 'package:exam_adv_flutter/controller/contact_controller.dart';
import 'package:exam_adv_flutter/service/auth_service/authThentication.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    var contactController = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Contact Page'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthService.authService.logOut();
                Get.toNamed('/sign-In');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                 contactController.readLive(value);
                },
                decoration: InputDecoration(
                  hintText: 'search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(9),
                  child: Card(
                    child: ListTile(
                        title: Text(contactController.data[index]['name']),
                        subtitle: Text(contactController.data[index]['phone']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                        'Update Contact',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: contactController.txtName,
                                            decoration: const InputDecoration(
                                                labelText: 'Name',
                                                enabledBorder: OutlineInputBorder(),
                                                focusedBorder: OutlineInputBorder()),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            controller: contactController.txtPhone,
                                            decoration: const InputDecoration(
                                                labelText: 'phone number',
                                                enabledBorder: OutlineInputBorder(),
                                                focusedBorder: OutlineInputBorder()),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            controller: contactController.txtEmail,
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
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(color: Colors.black),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              contactController.updateDataInContact(contactController.data[index]['id'],
                                                  contactController.txtName.text,
                                                  contactController.txtPhone.text,
                                                  contactController.txtEmail.text);
                                              Get.back();

                                            },
                                            child: const Text(
                                              'Save',
                                              style: TextStyle(color: Colors.black),
                                            ))
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  contactController.removeData(
                                    int.parse(
                                      contactController.data[index]['id']
                                          .toString(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        )),
                  ),
                ),
                itemCount: contactController.data.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Add Contact',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: contactController.txtName,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: contactController.txtPhone,
                    decoration: const InputDecoration(
                        labelText: 'phone number',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: contactController.txtEmail,
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
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      contactController.insertData(
                          contactController.txtName.text,
                          contactController.txtPhone.text,
                          contactController.txtEmail.text);
                      Get.back();
                      contactController.txtName.clear();
                      contactController.txtEmail.clear();
                      contactController.txtPhone.clear();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
