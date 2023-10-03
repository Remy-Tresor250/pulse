import "package:flutter/material.dart";

import "../styles/app_colors.dart";
import "home_page.dart";

enum ChatsMenus {
  chats,
  calls
}

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  ChatsMenus chatMenu = ChatsMenus.chats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Chats",
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
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.mediumGrey,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      if(chatMenu != ChatsMenus.chats) chatMenu = ChatsMenus.chats;
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: chatMenu == ChatsMenus.chats ?  Colors.white : AppColors.mediumGrey,
                        boxShadow: chatMenu == ChatsMenus.chats ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: const Offset(0, 2)
                          )
                        ] : [],
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child: const Text(
                        "Chats",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      if (chatMenu != ChatsMenus.calls) chatMenu = ChatsMenus.calls;
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: chatMenu == ChatsMenus.calls ?  Colors.white : AppColors.mediumGrey,
                          boxShadow: chatMenu == ChatsMenus.calls ?  [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset: const Offset(0, 2)
                            )
                          ] : [],
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child: const Text(
                        "Calls",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ) :
      const Row(),
    );
  }
}
