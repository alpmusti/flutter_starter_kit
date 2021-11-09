import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '/app/home/home_page.dart';
import '/core/constants/strings.dart';
import '/data/storage/hive_service_impl.dart';
import '/domain/repositories/login/login_repository.dart';
import '/core/controllers/base_view_model.dart';
import '/data/models/user.dart';

class LoginViewModel extends BaseViewModel<LoginRepository> {
  LoginViewModel(ItemCreator<LoginRepository> creator) : super(creator);

  late HiveServiceImpl _hiveService;

  final _username = "demo".obs;
  get username => _username.value;
  set username(newUsername) => _username.value = newUsername;

  final _password = "demo".obs;
  get password => _password.value;
  set password(newPassword) => _password.value = newPassword;

  bool get isValid {
    return (username.toString().length >= 4 && password.toString().length >= 4);
  }

  @override
  void onInit() async {
    super.onInit();
    _hiveService = Get.find();
    bool isLogin = await _hiveService.get(Strings.isLogin) ?? false;
    if (isLogin) {
      Get.offAllNamed(HomePage.name);
    }
  }

  Future login() async {
    isLoading = true;
    await repository.login(
      User(
        username: username,
        password: password,
      ),
    );
    isLoading = false;
    await _hiveService.save(Strings.isLogin, true);
  }
}
