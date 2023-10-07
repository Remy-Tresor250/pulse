import "package:flutter/material.dart";
import "package:pulse/components/posts.dart";
import "package:pulse/components/stories.dart";
import "package:pulse/components/toolbar.dart";
import "package:pulse/styles/app_colors.dart";

enum Menus {
  profile, 
  settings, 
  logout,
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
          leading: false,
          title: const Text(
            "Home",
            style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600
            ),
          ),
      ),

      body: MediaQuery.of(context).size.width < 620 ?
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Stories(),

               SizedBox(
                 height: 8,
               ),

               Posts()
            ],
          ),
        ),
      ) : const Column(),
    );
  }
}
