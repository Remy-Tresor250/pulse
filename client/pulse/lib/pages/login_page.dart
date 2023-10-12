import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pulse/model/user.dart";
import "package:pulse/provider/app_repo.dart";
import "package:pulse/service/login_service.dart";
import "package:pulse/styles/app_colors.dart";
import "package:pulse/styles/app_text.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  bool isViewPassword = false;

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

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            context.read<LoginService>().username = value;
                          },
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _username,
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r'^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}|(?:\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4})$')
                                .hasMatch(value)) {
                              return "Enter a valid number or email!";
                            }else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "Enter your phone or email address",
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

                        Stack(
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                context.read<LoginService>().password = value;
                              },
                              enableSuggestions: false,
                              autocorrect: false,
                              obscureText: !isViewPassword,
                              controller: _password,
                              validator: (value) {
                                if(value!.isEmpty || !RegExp(r'^.{6,30}$').hasMatch(value)) {
                                  return "Enter a valid password! min: 6, max: 30.";
                                }else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
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

                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 5,
                              child: IconButton(
                                  onPressed: () => setState(() {
                                      isViewPassword = !isViewPassword;
                                    }),
                                  icon: Icon(
                                    !isViewPassword ? Icons.remove_red_eye : Icons.visibility_off,
                                    color: AppColors.lightBlack,
                                  )
                              ),
                            ),
                          ],
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

                        const SizedBox(
                          height: 60,
                        ),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()) {
                                  context.read<LoginService>().login().then((value) => {
                                  context.read<AppRepo>().user = User.fromToken(value),
                                  Navigator.of(context).pushReplacementNamed("/home")
                                  });
                                }
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
                      ],
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
