import "package:flutter/material.dart";
import "package:pulse/styles/app_colors.dart";

class StoryItem extends StatelessWidget {
  const StoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: AppColors.veryLightGreen,
        borderRadius: BorderRadius.all(Radius.circular(60))
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(60)),
        child: Image.asset(
          "assets/temp/user1.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
