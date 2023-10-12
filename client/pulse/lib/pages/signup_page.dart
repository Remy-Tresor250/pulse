import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:pulse/styles/app_text.dart";

import "../service/register_service.dart";
import "../styles/app_colors.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int currentStep = 0;
  final formKey = GlobalKey<FormState>();
  bool isViewPassword = false;

  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _country;
  late final TextEditingController _city;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _password;
  late final TextEditingController _confirmPswd;

  @override
  void initState() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _country = TextEditingController();
    _city = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    _confirmPswd = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _country.dispose();
    _city.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPswd.dispose();
    super.dispose();
  }

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
              if(formKey.currentState!.validate()) currentStep = value;
            }),
            onStepContinue: () => setState(() {
              if(formKey.currentState!.validate() && currentStep < 3) {
                currentStep += 1;
              }else {
                if(_password.text != _confirmPswd.text){
                  const SnackBar snackBar = SnackBar(
                    content: Text("Passwords don't match!"),
                    duration: Duration(seconds: 5),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  currentStep = 3;
                }else {
                  context.read<RegisterService>().register()
                      .then((res) => {
                    Navigator.of(context).pushReplacementNamed("/"),
                  }).catchError((error) {
                    throw Exception(error);
                  });
                }
              }
            }),
            onStepCancel: () => setState(() {
              if(formKey.currentState!.validate() && !(currentStep <= 0)) currentStep -= 1;
            }),
            steps: [
              Step(
                  title: const Text("Names"),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0 ? StepState.complete : StepState.disabled,
                  content: Form(
                    key: currentStep == 0 ? formKey : null,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),

                        const Text(
                          "Pulse wanna know your names!",
                          style: AppText.header2,
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        TextFormField(
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            context.read<RegisterService>().firstName = value;
                          },
                          controller: _firstName,
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r"^(?!.*[-_]{2})[a-zA-Z\-_]+$").hasMatch(value)) {
                              return "Enter a valid name!";
                            }else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
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

                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          controller: _lastName,
                          onChanged: (value) {
                            context.read<RegisterService>().lastName = value;
                          },
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r"^(?!.*[-_]{2})[a-zA-Z\-_]+$").hasMatch(value)){
                              return "Enter a valid name!";
                            }else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
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
                    ),
                  )
              ),

              Step(
                  title: const Text("Location"),
                  isActive: currentStep >= 1,
                  state: currentStep >= 1 ? StepState.complete : StepState.disabled,
                  content: Form(
                    key: currentStep == 1 ? formKey : null,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),

                        const Text(
                          "Pulse wanna know your Location!",
                          style: AppText.header2,
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        TextFormField(
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          controller: _country,
                          onChanged: (value) {
                            context.read<RegisterService>().country = value;
                          },
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r"^[a-zA-Z0-9]{2,50}$").hasMatch(value)) {
                              return "Enter a valid country with 2 minimum characters and 50 maximum characters!";
                            }else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
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

                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          controller: _city,
                          onChanged: (value) {
                            context.read<RegisterService>().city = value;
                          },
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r"^[a-zA-Z0-9]{2,100}$").hasMatch(value)) {
                              return "Enter a valid city!";
                            }else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
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
                    ),
                  )
              ),

              Step(
                  title: const Text("Email & phone"),
                  isActive: currentStep >= 2,
                  state: currentStep >= 2 ? StepState.complete : StepState.disabled,
                  content: Form(
                    key: currentStep == 2 ? formKey : null,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),

                        const Text(
                          "Pulse wanna know your contacts!",
                          style: AppText.header2,
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        TextFormField(
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _email,
                          onChanged: (value) {
                            context.read<RegisterService>().email = value;
                          },
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+$").hasMatch(value)) {
                              return "Enter a valid email!";
                            }else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
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

                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.phone,
                          controller: _phone,
                          onChanged: (value) {
                            context.read<RegisterService>().phone = value;
                          },
                          validator: (value) {
                            if(value!.isEmpty || !RegExp(r"^(?:\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$").hasMatch(value)) {
                              return "Enter a valid phone number!";
                            }else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "Phone number",
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
                    ),
                  )
              ),

              Step(
                  title: const Text("Password"),
                  isActive: currentStep >= 3,
                  state: currentStep >= 3 ? StepState.complete : StepState.disabled,
                  content: Form(
                    key: currentStep == 3 ? formKey : null,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),

                        const Text(
                          "Now set a strong password for login!",
                          style: AppText.header2,
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        Stack(
                          children: [
                            TextFormField(
                              enableSuggestions: false,
                              autocorrect: false,
                              obscureText: !isViewPassword,
                              keyboardType: TextInputType.text,
                              controller: _password,
                              onChanged: (value) {
                                context.read<RegisterService>().password = value;
                              },
                              validator: (value) {
                                if(value!.isEmpty || !RegExp(r"^.{6,100}$").hasMatch(value)){
                                  return "Enter a valid, strong password with minimum 6 characters!";
                                }else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
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

                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 5,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isViewPassword = !isViewPassword;
                                    });
                                  },
                                  icon: Icon(
                                    !isViewPassword ? Icons.remove_red_eye : Icons.visibility_off,
                                    color: AppColors.lightBlack,
                                  )
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Stack(
                          children: [
                            TextFormField(
                              enableSuggestions: false,
                              autocorrect: false,
                              obscureText: !isViewPassword,
                              keyboardType: TextInputType.text,
                              controller: _confirmPswd,
                              validator: (value) {
                                if(value!.isEmpty || !RegExp(r"^.{6,100}$").hasMatch(value)){
                                  return "Enter a valid, strong password with minimum 6 characters!";
                                }else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
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

                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 5,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isViewPassword = !isViewPassword;
                                    });
                                  },
                                  icon: Icon(
                                    !isViewPassword ? Icons.remove_red_eye : Icons.visibility_off,
                                    color: AppColors.lightBlack,
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
