import 'package:hive/hive.dart';
import 'package:sciflare/data/models/user_model.dart';
import 'package:sciflare/helpers/constants.dart';

class Boxes {
  static Box<UserModel> getUsers() => Hive.box(Constants.DB_NAME);
}
