import "package:flutter/material.dart";
import "package:pulse/components/call_item.dart";

class CallsList extends StatelessWidget {
  const CallsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return const CallItem();
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
