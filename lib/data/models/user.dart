import '/data/models/base.dart';

class User extends BaseModel {
  String? username;
  String? password;
  User({
    this.username,
    this.password,
  });

  @override
  fromJson(Map data) => User(
        username: data['username'],
        password: data['password'],
      );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
