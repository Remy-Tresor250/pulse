import "package:flutter/material.dart";
import "package:pulse/components/bottom_navigator.dart";
import "package:pulse/components/new_post_modal.dart";
import "package:pulse/pages/chats.dart";
import "package:pulse/pages/home_page.dart";


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainMenus currentPage = MainMenus.home;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      body: pages[currentPage.index],
      bottomNavigationBar: BottomNavigator(
        currentPage: currentPage,
        onTap: (MainMenus value) {
          if(value == MainMenus.addPost) {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return const NewPostModal();
                }
            );
            return;
          }
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }

  final List<Widget> pages = [
    const HomePage(),
    const Chats(),
  ];
}
