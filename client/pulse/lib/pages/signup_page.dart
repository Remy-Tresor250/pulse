import "package:flutter/material.dart";
import "package:pulse/styles/app_text.dart";

import "../styles/app_colors.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int currentStep = 0;

  Widget controlsBuilder(context , details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          ElevatedButton(
              onPressed: details.onStepContinue,
              child: Text(currentStep != 3 ? "Next" : "Sign up")
          ),

          const SizedBox(
            width: 20,
          ),

          OutlinedButton(
              onPressed: currentStep != 0 ? details.onStepCancel : () => Navigator.of(context).pushReplacementNamed("/"),
              child: const Text("Back")
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Sign up on Pulse",
          style: TextStyle(
            color: AppColors.primary
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.veryLightBlue,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 620 ? 500 : double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stepper(
            type: StepperType.vertical,
            currentStep: currentStep,
            controlsBuilder: controlsBuilder,
            onStepTapped: (value) => setState(() {
              currentStep = value;
            }),
            onStepContinue: () => setState(() {
              if(!(currentStep >= 3)) currentStep += 1;
            }),
            onStepCancel: () => setState(() {
              if (!(currentStep <= 0)) currentStep -= 1;
            }),
            steps: [
              Step(
                  title: const Text("Names"),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0 ? StepState.complete : StepState.disabled,
                  content: const Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),

                      Text(
                        "Pulse wanna know your names!",
                        style: AppText.header2,
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "First name",
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

                      SizedBox(
                        height: 20,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Last name",
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
                    ],
                  )
              ),

              Step(
                  title: const Text("Location"),
                  isActive: currentStep >= 1,
                  state: currentStep >= 1 ? StepState.complete : StepState.disabled,
                  content: const Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),

                      Text(
                        "Pulse wanna know your Location!",
                        style: AppText.header2,
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Country",
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

                      SizedBox(
                        height: 20,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "City or Town",
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
                    ],
                  )
              ),

              Step(
                  title: const Text("Email & phone"),
                  isActive: currentStep >= 2,
                  state: currentStep >= 2 ? StepState.complete : StepState.disabled,
                  content: const Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),

                      Text(
                        "Pulse wanna know your contacts!",
                        style: AppText.header2,
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
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

                      SizedBox(
                        height: 20,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Contacts",
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
                    ],
                  )
              ),

              Step(
                  title: const Text("Password"),
                  isActive: currentStep >= 3,
                  state: currentStep >= 3 ? StepState.complete : StepState.disabled,
                  content: const Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),

                      Text(
                        "Now set a strong password for login!",
                        style: AppText.header2,
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "password",
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

                      SizedBox(
                        height: 20,
                      ),

                      TextField(
                        enableSuggestions: true,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "confirm password",
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
                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
