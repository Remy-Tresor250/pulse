import "package:flutter/material.dart";
import "package:pulse/styles/app_colors.dart";
import "package:pulse/styles/app_text.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 620 ? 500 : double.infinity,
            height: MediaQuery.of(context).size.height > 783 ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height + 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  const Spacer(),

                  const Text(
                    "Welcome to Pulse",
                    style: AppText.header2,
                  ),

                  const SizedBox(
                    height: 60,
                  ),

                  const TextField(
                    enableSuggestions: true,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter your email address",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightBlack),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      )
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  const TextField(
                    enableSuggestions: true,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightBlack),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.lightBlack
                        ),
                        child: const Text("Forgot password")
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("/home");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          )
                        ),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 16
                          ),
                        )
                    ),
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: AppColors.lightBlack
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/sign-up");
                      },
                      child: const Text(
                        "Sign up here",
                        style: TextStyle(
                          color: AppColors.primary
                        ),
                      )
                  ),

                  const Spacer(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
