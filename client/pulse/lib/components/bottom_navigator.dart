import "package:flutter/material.dart";
import "package:pulse/styles/app_colors.dart";

enum MainMenus {
  home,
  messages,
  addPost,
  reels,
  explore
}

class BottomNavigator extends StatelessWidget {
  final MainMenus currentPage;
  final ValueChanged<MainMenus> onTap;
  const BottomNavigator({super.key, required this.currentPage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: const EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.veryLightBlue,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: IconButton(
                        onPressed: () => onTap(MainMenus.home),
                        icon: const Icon(Icons.home),
                      )
                  ),

                  Expanded(
                      child: IconButton(
                        onPressed: () => onTap(MainMenus.messages),
                        icon: const Icon(Icons.message),
                      )
                  ),

                  const Expanded(
                    child: SizedBox(),
                  ),

                  Expanded(
                      child: IconButton(
                        onPressed: () => onTap(MainMenus.reels),
                        icon: const Icon(Icons.video_collection),
                      )
                  ),

                  Expanded(
                      child: IconButton(
                        onPressed: () => onTap(MainMenus.explore),
                        icon: const Icon(Icons.explore),
                      )
                  ),
                ],
              ),
            ),
          ),

          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => onTap(MainMenus.addPost),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 7,
                        spreadRadius: 2,
                        offset: const Offset(0, 2)
                      )
                    ]
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
