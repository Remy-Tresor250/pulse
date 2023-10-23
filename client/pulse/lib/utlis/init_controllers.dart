import "package:get/get.dart";
import "package:pulse/controllers/create_post_service.dart";
import "package:pulse/controllers/get_posts_service.dart";

class InitControllers extends Bindings {
  @override
  void dependencies() {
    Get.put(PostService());
    Get.put(GetPostsService());
  }

}