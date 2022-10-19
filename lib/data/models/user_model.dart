import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String email;
  @HiveField(2)
  late final String mobile;
  @HiveField(3)
  late final String gender;
}
