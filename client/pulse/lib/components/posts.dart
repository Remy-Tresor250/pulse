import "package:flutter/material.dart";
import "package:pulse/components/post_item.dart";

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return const PostItem();
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 24,),
          itemCount: 100
      ),
    );
  }
}
