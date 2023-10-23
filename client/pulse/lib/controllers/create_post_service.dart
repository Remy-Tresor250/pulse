import "package:dio/dio.dart" as dio;
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:get/get.dart";
import "package:image_cropper/image_cropper.dart";
import "package:image_picker/image_picker.dart";

class PostService extends GetxController {

  String? description;
  RxString? picturePath = "".obs;

  pickImage(ImageSource source) async {
    final imgPath = await ImagePicker().pickImage(source: source);
    final croppedImg = await ImageCropper().cropImage(
      sourcePath: imgPath!.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.square
      ]
    );

    picturePath?.value = croppedImg!.path;
  }

  Future<Map<String, dynamic>> createPost (String token, String userId) async {
    late final Map<String, dynamic> result;

    final dio.FormData formData = dio.FormData.fromMap({
      "description": description,
      "file": await dio.MultipartFile.fromFile(picturePath!.value),
    });

    await dio.Dio().post(
        "${dotenv.get("API_URL", fallback: "API_URL_NOT_FOUND")}/posts/new-post/user/$userId",
        data: formData,
        options: dio.Options(headers: {
          "Authorization": "Bearer $token"
        })
    ).then((res) => result = res.data)
        .catchError((error) {
          throw Exception(error);
        });

    return result;
  }

}