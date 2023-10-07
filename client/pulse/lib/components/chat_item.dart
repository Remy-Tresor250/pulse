import "package:flutter/material.dart";
import "package:pulse/components/user_avatar.dart";
import "package:pulse/styles/app_colors.dart";

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Row(
        children: [
          UserAvatar(size: 40,),

          SizedBox(
            width: 20,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Samantha Grace"),
              Text(
                  "Hey! how are you doing?",
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
