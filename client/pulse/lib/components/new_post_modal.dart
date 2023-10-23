import "dart:io";

import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pulse/components/camera_image_picker.dart";
import "package:pulse/components/custom_image_picker.dart";
import "package:pulse/controllers/create_post_service.dart";
import "package:pulse/controllers/get_posts_service.dart";
import "package:pulse/model/user.dart";
import "package:pulse/provider/app_repo.dart";
import "package:pulse/styles/app_colors.dart";
import "package:get/get.dart";

class NewPostModal extends StatefulWidget {
  const NewPostModal({super.key});

  @override
  State<NewPostModal> createState() => _NewPostModalState();
}

class _NewPostModalState extends State<NewPostModal> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final User? user = context.read<AppRepo>().user;
    PostService postService = Get.find();

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
            onChanged: (value) {
              postService.description = value;
            },
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

          Obx(() => Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: AppColors.lightBlack,
                  width: 2
              ),
            ),
            child: postService.picturePath!.value.isEmpty ? const Center(
              child: Text("uploaded"),
            ) : Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.file(File(postService.picturePath!.value)),
                ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                          postService.picturePath!.value = "";
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                )
              ]
            ),
          ),),

          const SizedBox(
            height: 20,
          ),

          SizedBox(
            width: double.maxFinite,
            height: 40,
            child: Opacity(
              opacity: loading ? 0.5 : 1,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    postService.createPost(user!.token, user.id)
                        .then((_) {
                          Navigator.of(context).pop();
                          Get.find<GetPostsService>().fetchPosts(user.token);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: const Text("Your post is now created successfully!")
                            ),
                            duration: const Duration(seconds: 5),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          )
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: const Text("Something went wrong! try again!")
                            ),
                            duration: const Duration(seconds: 5),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          )
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: !loading ? const Text("POST") : const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2,)
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
