import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pulse/components/post_item.dart";
import "package:pulse/controllers/get_posts_service.dart";
import "../model/user.dart";
import "../provider/app_repo.dart";
import "package:get/get.dart";

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = context.read<AppRepo>().user;
    Get.find<GetPostsService>().fetchPosts(user!.token);

    return Obx(() => SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return PostItem(
              post: Get.find<GetPostsService>().posts[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 24,),
          itemCount: Get.find<GetPostsService>().posts.length
      ),
    ));
  }
}
