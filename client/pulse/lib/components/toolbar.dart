import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pulse/provider/app_repo.dart";
import "../styles/app_colors.dart";

enum Menus {
  profile,
  settings,
  logout,
}

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final bool leading;
  Widget? leadingWidget;
  final Widget title;

  Toolbar({super.key, required this.leading, required this.title});

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
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
                context.read<AppRepo>().user = null;
                Navigator.of(context).pushNamed("/");
                break;
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
    ];

    return AppBar(
      title: title,
      automaticallyImplyLeading: leading,
      leading: leadingWidget,
      actions: actions,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
