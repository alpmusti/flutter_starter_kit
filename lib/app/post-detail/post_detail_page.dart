import 'package:flutter/material.dart';

import '/core/components/base_page.dart';
import '/data/models/post.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titleKey: 'post_detail',
      hasScroll: false,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: Theme.of(context).textTheme.headline5),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(post.body!,
                        style: Theme.of(context).textTheme.caption),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
