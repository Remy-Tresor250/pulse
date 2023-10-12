import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pulse/components/user_avatar.dart";
import "package:pulse/model/user.dart";
import "package:pulse/provider/app_repo.dart";
import "package:pulse/styles/app_text.dart";

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = context.read<AppRepo>().user;

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),

        Row(
          children: [
            const UserAvatar(size: 40,),

            const SizedBox(
              width: 10,
            ),

            Text(
              "${user?.firstName} ${user?.lastName}",
              style: AppText.subtitle1,
            ),
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            "assets/temp/post1.jpg"
          ),
        ),

        const SizedBox(
          height: 10,
        ),
        
        const Text(
          "🌴 Exploring the beauty of nature! 🌿✨ Serene moments by the beach, soaking up the sun, and feeling the sand between my toes. Life is a journey, and I'm taking each step with gratitude. 🌊☀️ #BeachLife #NatureLover #Wanderlust",
          style: AppText.subtitle3,
        )
      ],
    );
  }
}
