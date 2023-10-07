import "package:flutter/material.dart";
import "package:pulse/components/user_avatar.dart";
import "package:pulse/styles/app_text.dart";

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),

        const Row(
          children: [
            UserAvatar(size: 40,),

            SizedBox(
              width: 10,
            ),

            Text(
              "Remy Tresor",
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
