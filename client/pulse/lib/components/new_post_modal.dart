import "package:flutter/material.dart";
import "package:pulse/components/camera_image_picker.dart";
import "package:pulse/components/custom_image_picker.dart";
import "package:pulse/styles/app_colors.dart";

class NewPostModal extends StatelessWidget {
  const NewPostModal({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Create a new post!",
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: 5,
            decoration:  const InputDecoration(
              hintText: "What's on your mind?",
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              filled: true,
              fillColor: AppColors.mediumGrey,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          const CustomImagePicker(
              text: "Upload from gallery"
          ),

          const SizedBox(
            height: 20,
          ),

          const Text(
           "Or",
           style: TextStyle(
             color: Colors.grey,
             fontSize: 16
           ),
          ),

          const SizedBox(
            height: 20,
          ),

          const CameraImagePicker(
              text: "Take a picture from camera"
          ),

          const SizedBox(
            height: 20,
          ),

          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: AppColors.lightBlack,
                width: 2
              ),
            ),
            child: const Center(
              child: Text("uploaded"),
            ),
          )
        ],
      ),
    );
  }
}
