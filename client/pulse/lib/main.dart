import 'package:flutter/material.dart';
import 'package:pulse/pages/login_page.dart';
import 'package:pulse/pages/main_page.dart';
import 'package:pulse/pages/notifications.dart';
import 'package:pulse/pages/profile.dart';
import 'package:pulse/pages/signup_page.dart';

void main() {
  runApp(const Pulse());
}

class Pulse extends StatelessWidget {
  const Pulse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        brightness: Brightness.light
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Login(),
        "/sign-up": (context) => const SignUp(),
        "/home": (context) => const MainPage(),
        "/notifications": (context) => const Notifications(),
        "/profile": (context) => Profile(),
      },
    );
  }
}
