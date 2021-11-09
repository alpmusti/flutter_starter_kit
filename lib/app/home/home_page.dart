import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/app/post-detail/post_detail_page.dart';
import 'package:get/get.dart';

import '/app/home/home_view_model.dart';
import '/core/repository/base_repository_impl.dart';
import '/core/components/base_page.dart';

class HomePage extends StatelessWidget {
  static const String name = '/home';
  HomePage({Key? key}) : super(key: key);
  final viewModel = Get.put(HomeViewModel(() => BaseRepositoryImpl()));

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titleKey: 'posts',
      child: Obx(
        () => ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(viewModel.posts[index].title),
            onTap: () => Get.to(
              PostDetail(post: viewModel.posts[index]),
            ),
          ),
          itemCount: viewModel.posts.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
        ),
      ),
    );
  }
}
