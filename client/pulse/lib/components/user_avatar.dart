import "package:flutter/material.dart";

class UserAvatar extends StatelessWidget {
  final double size;
  final String url;
  const UserAvatar({super.key, required this.size, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Image.asset(
        url,
        fit: BoxFit.cover,
        width: size,
        height: size,
      ),
    );
  }
}
