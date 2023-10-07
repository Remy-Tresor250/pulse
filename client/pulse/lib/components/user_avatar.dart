import "package:flutter/material.dart";

class UserAvatar extends StatelessWidget {
  final double size;
  const UserAvatar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Image.asset(
        "assets/temp/user1.png",
        fit: BoxFit.cover,
        width: size,
        height: size,
      ),
    );
  }
}
