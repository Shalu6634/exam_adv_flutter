import 'package:exam_adv_flutter/service/contact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  RxList data = [].obs;

  List name = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initDb();
  }

  Future<void> initDb() async {
    await ContactHelper.contactHelper.database;
  }

  Future<void> insertData(String name, String phone, String email) async {
    await ContactHelper.contactHelper.insertContactData(name, phone, email);
    await getContactData();
  }

  Future<RxList> getContactData() async {
    data.value = await ContactHelper.contactHelper.readData();

    return data;
  }

   Future<void> updateDataInContact(int id,String name, String phone, String email)
   async {
     await ContactHelper.contactHelper.updateData(id, name, phone, email);
     await getContactData();
   }

  Future<void> removeData(int id) async {
    await ContactHelper.contactHelper.removeDetail(id);
    await getContactData();
  }

  Future<void> readLive(String value)
  async {
    data.value = await ContactHelper.contactHelper.readLiveData(value);

  }
}
