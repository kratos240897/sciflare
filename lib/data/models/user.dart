class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.mobile,
  });
  late final String? id;
  late final String? name;
  late final String? email;
  late final String? gender;
  late final String? mobile;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['mobile'] = mobile;
    return data;
  }
}
