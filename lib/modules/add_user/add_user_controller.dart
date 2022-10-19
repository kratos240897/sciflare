import 'package:get/get.dart';
import 'package:sciflare/data/models/user_model.dart';
import 'package:sciflare/helpers/boxes.dart';
import 'package:sciflare/helpers/utils.dart';
import 'package:sciflare/repo/app_repo.dart';

class AddUserController extends GetxController {
  final _repo = Get.find<AppRepo>();
  adduser(
      {required String name,
      required String email,
      required String mobile,
      required String gender}) {
    showLoading(Get.context!);
    _repo.addUser({
      'name': name,
      'email': email,
      'mobile': mobile,
      'gender': gender
    }).then((value) {
      hideLoading(Get.context!);
      final user = UserModel()
        ..name = value.name ?? ''
        ..email = value.email ?? ''
        ..mobile = value.mobile ?? ''
        ..gender = value.gender ?? '';
      final box = Boxes.getUsers();
      box.add(user);
      showSnackBar('Success', 'User added successfully', Get.context!, true);
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.back(result: true);
      }).onError((error, stackTrace) {
        hideLoading(Get.context!);
        throw error.toString();
      });
    });
  }
}
