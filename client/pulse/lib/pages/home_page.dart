import "package:flutter/material.dart";
import "package:pulse/components/posts.dart";
import "package:pulse/components/stories.dart";
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Home",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/notifications");
              },
              color: AppColors.lightBlack,
              icon: const Icon(Icons.notifications)
          ),

          PopupMenuButton<Menus>(
              color: AppColors.lightBlack,
              onSelected: (value) {
                switch (value) {
                  case Menus.profile:
                    Navigator.of(context).pushNamed("/profile");
                    break;

                  case Menus.settings:
                    Navigator.of(context).pushNamed("/settings");
                    break;

                  case Menus.logout:
                    Navigator.of(context).pushNamed("/");
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: Menus.profile,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: Menus.settings,
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: Menus.logout,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ];
              })
        ],
        elevation: 0,
        backgroundColor: Colors.white,
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
