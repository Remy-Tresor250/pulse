import "package:flutter/material.dart";
import "package:pulse/styles/app_colors.dart";

class CustomImagePicker extends StatelessWidget {
  final String text;
  const CustomImagePicker({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          onPressed: () {
            //implement image picking logic
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
