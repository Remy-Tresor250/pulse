import "package:flutter/material.dart";
import "package:pulse/components/calls_list.dart";
import "package:pulse/components/chats_list.dart";
import "package:pulse/components/toolbar.dart";

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
      appBar: Toolbar(
        leading: false,
        title: const Text(
          "Chats",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600
          ),
        ),
      ),

      body: MediaQuery.of(context).size.width < 620 ?
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24, right: 24, left: 24),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.mediumGrey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
            ),

             Container(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 margin: const EdgeInsets.only(top: 25),
                 height: MediaQuery.of(context).size.height,
                 child: chatMenu == ChatsMenus.chats ? const ChatsList() : const CallsList(),
            ),
          ],
        ),
      ) :
      const Row(),
    );
  }
}
