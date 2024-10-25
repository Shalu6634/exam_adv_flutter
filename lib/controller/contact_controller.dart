import 'package:exam_adv_flutter/service/contact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactController extends GetxController
{
  TextEditingController txtEmail=TextEditingController();
  TextEditingController txtPassword=TextEditingController();
  TextEditingController txtName=TextEditingController();
  TextEditingController txtConfirmPassword=TextEditingController();
  TextEditingController txtPhone=TextEditingController();
   RxList data = [].obs;

   List name = [];

   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initDb();
  }
  Future<void> initDb()
  async {
   await  ContactHelper.contactHelper.database;
  }

  Future<void> insertData(String name, String phone, String email)
  async {
     await ContactHelper.contactHelper.insertContactData(name, phone, email);

    await getData();

  }

  Future<void> getData()
  async {
    await ContactHelper.contactHelper.readData();
  }


  Future<void> removeData(int id)
  async {
    await ContactHelper.contactHelper.removeDetail(id);
  }
}