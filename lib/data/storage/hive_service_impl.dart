import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import '/core/constants/strings.dart';
import '/data/storage/hive_service.dart';

class HiveServiceImpl extends GetxService implements HiveService {
  @override
  Future<Box> openBox(String boxName) async {
    return Hive.openBox(boxName);
  }

  @override
  Future<dynamic> get(String key) async {
    var box = await openBox(Strings.generalBox);
    return box.get(key);
  }

  @override
  Future<void> save(String key, value) async {
    var box = await openBox(Strings.generalBox);
    box.put(key, value);
  }
}
