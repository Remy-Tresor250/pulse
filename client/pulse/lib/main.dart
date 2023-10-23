import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pulse/pages/login_page.dart';
import 'package:pulse/pages/main_page.dart';
import 'package:pulse/pages/notifications.dart';
import 'package:pulse/pages/profile.dart';
import 'package:pulse/pages/signup_page.dart';
import 'package:pulse/provider/app_repo.dart';
import 'package:pulse/service/login_service.dart';
import 'package:pulse/service/register_service.dart';
import 'package:pulse/utlis/init_controllers.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(
      ChangeNotifierProvider(
        create: (context) => AppRepo(),
        child: const Pulse(),
      )
  );
}

class Pulse extends StatelessWidget {
  const Pulse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitControllers(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        brightness: Brightness.light
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => ChangeNotifierProvider(
          create: (context) => LoginService(),
          child: const Login(),
        ),
        "/sign-up": (context) => ChangeNotifierProvider(
          create: (context) => RegisterService(),
          child: const SignUp(),
        ),
        "/home": (context) => const MainPage(),
        "/notifications": (context) => const Notifications(),
        "/profile": (context) => const Profile(),
      },
    );
  }
}
