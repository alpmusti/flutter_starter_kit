import '../../../core/networking/model/api_response.dart';
import '/core/repository/base_repository.dart';
import '/data/models/user.dart';

class LoginRepository extends BaseRepository {
  Future<APIResponse> login(User user) async {
    // ------
    // TODO: implement your login logic here
    await Future.delayed(const Duration(seconds: 3));
    // -----
    return APIResponse(isSuccess: true);
  }
}
