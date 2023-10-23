import "package:dio/dio.dart" as dio;
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";

class PostService extends GetxController {

  String? userId;
  String? description;
  RxString? picturePath = "".obs;

  pickImage(ImageSource source) async {
    final imgPath = await ImagePicker().pickImage(source: source);
    picturePath?.value = imgPath!.path;
    print(picturePath!.value);
  }

  Future<void> createPost () async {
    try{

      final dio.FormData formData = dio.FormData.fromMap({
        "description": description,
        "file": await dio.MultipartFile.fromFile(picturePath!.value),
      });

      await dio.Dio().post(
          "${dotenv.get("API_URL", fallback: "API_URL_NOT_FOUND")}/posts/new-post/user/$userId",
          data: formData
      ).catchError((error) {
        throw Exception(error);
      });

    } catch (error) {
      throw Exception(error);
    }
  }

}