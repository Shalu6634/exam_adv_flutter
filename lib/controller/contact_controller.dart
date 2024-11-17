import 'package:exam_adv_flutter/helper/contact_helper.dart';
import 'package:exam_adv_flutter/modal/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DbController extends GetxController
{

  TextEditingController txtName  = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtComPassword = TextEditingController();


  RxList data = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initDb();
    getData();
  }
  Future<void> initDb() async {
    await DbHelper.dbHelper.database;
    await getData();
  }
  Future<void> insertData(String name,String phone,String email)
  async {
    await DbHelper.dbHelper.insertContact(name, phone, email);
    await getData();
  }
  Future<RxList> getData()
  async {
    data.value = await DbHelper.dbHelper.readContactData();
    return data;
  }
  Future<void> deleteDetail(int id)
  async {
    await DbHelper.dbHelper.removeDetail(id);
    print(id);
    await getData();
  }
  Future<void> updateDetail(String name,String phone,String email,int id)
  async {
    await DbHelper.dbHelper.updateContact(name, phone, email, id);
    await getData();
  }


}