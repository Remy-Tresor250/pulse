import "package:flutter/material.dart";

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: Image.asset(
        "assets/temp/user1.png",
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
    );
  }
}
