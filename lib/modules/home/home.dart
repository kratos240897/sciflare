import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciflare/helpers/styles.dart';
import 'package:sciflare/routes/routes.dart';

import 'home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () async {
                var reload = await Get.toNamed(Routes.ADD_USER);
                if (reload) {
                  controller.getusers();
                }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(() {
        return controller.users.isEmpty
            ? const Center(
                child: Text(
                  'No users found',
                  style: styleBold18,
                ),
              )
            : ListView.separated(
                itemCount: controller.users.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      user.name!,
                      style: styleBold18,
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          '${user.email} - ${user.mobile}',
                          style: styleBold16,
                        ),
                      ],
                    ),
                  );
                },
              );
      }),
    );
  }
}
