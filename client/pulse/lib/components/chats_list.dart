import "package:flutter/material.dart";
import "package:pulse/components/chat_item.dart";

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return const ChatItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 1,
            height: 20,
          );
        },
        itemCount: 100
    );
  }
}
