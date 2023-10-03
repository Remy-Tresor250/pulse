import "package:flutter/material.dart";

import "../styles/app_colors.dart";

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.veryLightBlue,
          ),
        ),
      ),

      body: const Column(),
    );
  }
}
