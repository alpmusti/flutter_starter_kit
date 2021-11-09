import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Future<Box> openBox(String boxName);

  Future<dynamic> get(String key);

  Future<void> save(String key, dynamic value);
}
