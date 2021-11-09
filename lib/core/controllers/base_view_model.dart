import 'package:get/get.dart';
import '/core/repository/base_repository.dart';

typedef ItemCreator<S> = S Function();

abstract class BaseViewModel<T extends BaseRepository> extends GetxController {
  ItemCreator<T> creator;
  late T repository;
  BaseViewModel(this.creator) {
    repository = creator();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool newValue) => _isLoading.value = newValue;
}
