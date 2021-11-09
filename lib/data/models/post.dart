import 'package:flutter_starter_kit/data/models/base.dart';

class Post extends BaseModel {
  Post({
    this.id,
    this.title = '',
    this.body,
  });

  int? id;
  String title;
  String? body;

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
      };

  @override
  fromJson(Map data) => Post(
        id: data["id"],
        title: data["title"],
        body: data["body"],
      );
}
