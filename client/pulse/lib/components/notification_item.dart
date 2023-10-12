import "package:flutter/material.dart";
import "package:pulse/styles/app_colors.dart";

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            Text("Remy Tresor and 1k others has like you post about the trip to miami")
          ],
        ),

        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.lightBlack,
            )
        ),
      ],
    );
  }
}
