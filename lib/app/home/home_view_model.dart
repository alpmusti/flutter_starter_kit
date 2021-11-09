import 'package:flutter_starter_kit/core/networking/constants/api_constants.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '/core/controllers/base_view_model.dart';
import '/core/repository/base_repository.dart';
import '/data/models/post.dart';

class HomeViewModel extends BaseViewModel<BaseRepository> {
  HomeViewModel(ItemCreator<BaseRepository> creator) : super(creator);

  final RxList<Post> _posts = <Post>[].obs;
  List<Post> get posts => _posts;
  set posts(List<Post> newValue) => _posts.value = newValue;

  @override
  void onInit() async {
    super.onInit();
    await fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response =
        await repository.getRequest(APIConstants.postsPath, Post());
    if (response?.isSuccess == true && response?.data != null) {
      posts = response?.data as List<Post>;
    }
  }
}
