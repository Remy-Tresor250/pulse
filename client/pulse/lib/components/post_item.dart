import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:pulse/components/user_avatar.dart";
import "package:pulse/styles/app_colors.dart";
import "package:pulse/styles/app_text.dart";

import "../model/post.dart";

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),

        Row(
          children: [
            UserAvatar(size: 40, url: post.user.profile.isEmpty ? "assets/temp/default.png" : post.user.profile),

            const SizedBox(
              width: 10,
            ),

            Text(
              "${post.user.firstName} ${post.user.lastName}",
              style: AppText.subtitle1,
            ),
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        Align(
          alignment: Alignment.center,
          child: CachedNetworkImage(
            imageUrl: post.picturePath,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image(
                image: imageProvider,
              )
            ),
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Center(child: Text("Content failed to load!"),),
          ),
        ),

        const SizedBox(
          height: 10,
        ),
        
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            post.description,
            style: AppText.subtitle3,
          ),
        ),

        const SizedBox(
          height: 15,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.heart,
                      color: AppColors.primary,
                    )
                ),

                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_outlined,
                      color: AppColors.primary,
                    )
                )
              ],
            ),

            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    color: AppColors.primary,
                  )
              ),
            )
          ],
        )
      ],
    );
  }
}
