import "package:flutter/material.dart";
import "package:pulse/styles/app_colors.dart";

class CameraImagePicker extends StatelessWidget {
  final String text;
  const CameraImagePicker({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary
          ),
          onPressed: () {},
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
