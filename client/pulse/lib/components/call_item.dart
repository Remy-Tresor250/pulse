import "package:flutter/material.dart";
import "package:pulse/components/user_avatar.dart";
import "package:pulse/styles/app_colors.dart";

class CallItem extends StatelessWidget {
  const CallItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
         children: [
           UserAvatar(
             size: 40,
             url: "assets/temp/user1.png",
           ),

           SizedBox(
             width: 20,
           ),

           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Dailed call to Remy Tresor"),
               Text(
                 "04/10/2023 12:00",
                 style: TextStyle(
                     color: Colors.grey
                 ),
               ),
             ],
           ),
         ],
       ),

        Icon(
          Icons.phone_forwarded,
          color: AppColors.mediumGreen,
        )
      ],
    );
  }
}
