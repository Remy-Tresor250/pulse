import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:pulse/controllers/create_post_service.dart";
import "package:pulse/styles/app_colors.dart";
import "package:get/get.dart";

class CameraImagePicker extends StatelessWidget {
  final String text;
  const CameraImagePicker({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    PostService postService = Get.find();

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary
          ),
          onPressed: () {
            postService.pickImage(ImageSource.camera);
          },
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white
            ),
          )
      ),
    );
  }
}
