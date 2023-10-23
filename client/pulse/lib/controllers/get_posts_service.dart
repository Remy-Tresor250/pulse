import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' as getx;
import 'package:pulse/model/post.dart';


class GetPostsService extends getx.GetxController {

  getx.RxList posts = [].obs;

  fetchPosts(String token) async {
    posts.clear();
    posts.addAll(await getAllPosts(token));
  }

  Future<List> getAllPosts (String token) async {

    late final Map<String, dynamic> results;

    await Dio().get(
        "${dotenv.get("API_URL", fallback: "API_URL_NOT_FOUND")}/posts/all",
        options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
        )
    ).then((res) => results = res.data).catchError((error) => Exception(error));

    return List.generate(results["data"].length, (index) => Post.fromJson(results["data"][index], token));

  }

}