import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciflare/helpers/styles.dart';
import 'package:sciflare/helpers/utils.dart';
import 'add_user_controller.dart';

class AddUser extends GetView<AddUserController> {
  AddUser({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  label: const Text('Name'),
                  prefixIcon: const Icon(Icons.person_add_alt_1_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0))),
            ),
            vSpace(12.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0))),
            ),
            vSpace(12.0),
            TextFormField(
              controller: mobileController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mobile_friendly_outlined),
                  label: const Text('Mobile'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0))),
            ),
            vSpace(12.0),
            TextFormField(
              controller: genderController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.female_outlined),
                  label: const Text('Gender'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0))),
            ),
            vSpace(25.0),
            ElevatedButton(
                onPressed: () {
                  if (validate()) {
                    controller.adduser(
                        name: nameController.text,
                        email: emailController.text,
                        mobile: mobileController.text,
                        gender: genderController.text);
                  }
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'ADD',
                    style: styleBold16,
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  validate() {
    if (nameController.text.isEmpty) {
      showSnackBar('Invalid', 'Please enter a name', Get.context!, false);
      return false;
    }
    if (emailController.text.isEmpty) {
      showSnackBar('Invalid', 'Please enter a email', Get.context!, false);
      return false;
    }
    if (mobileController.text.isEmpty) {
      showSnackBar('Invalid', 'Please enter a mobile', Get.context!, false);
      return false;
    }
    if (genderController.text.isEmpty) {
      showSnackBar('Invalid', 'Please enter a gender', Get.context!, false);
      return false;
    }
    return true;
  }
}
