import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import 'package:pulse/controllers/create_post_service.dart';
import "package:pulse/styles/app_colors.dart";

class CustomImagePicker extends StatelessWidget {
  final String text;
  const CustomImagePicker({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    PostService postService = Get.find();

    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            postService.pickImage(ImageSource.gallery);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary
          ),
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
