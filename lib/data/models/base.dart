abstract class BaseModel<T> {
  T fromJson(Map data);
  Map<String, dynamic> toJson();
}
