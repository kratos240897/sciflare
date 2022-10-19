import 'package:get/get.dart';
import 'package:sciflare/data/models/user.dart';
import 'package:sciflare/helpers/utils.dart';
import 'package:sciflare/repo/app_repo.dart';

class HomeController extends GetxController {
  final _repo = Get.find<AppRepo>();
  final RxList<User> users = RxList.empty();
  @override
  void onReady() {
    getusers();
    super.onReady();
  }

  getusers() {
    showLoading(Get.context!);
    _repo.getUsers().then((value) {
      hideLoading(Get.context!);
      users.value = value;
    }).onError((error, stackTrace) {
      hideLoading(Get.context!);
      throw error.toString();
    });
  }
}
