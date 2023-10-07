import "package:flutter/material.dart";
import "package:pulse/components/user_avatar.dart";

import "../styles/app_colors.dart";

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _email;
  late final TextEditingController _location;
  late final TextEditingController _phone;

  @override
  void initState() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _location = TextEditingController();
    _phone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _location.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _firstName.text = "Remy Tresor";
    _lastName.text = "NIYITEGEKA";
    _email.text = "remytresor@gmail.com";
    _location.text = "Nyarugenge, Muhima";
    _phone.text = "+250785279830";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.veryLightBlue,
          ),
        ),

        title: const Text(
          "Profile",
          style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600
          ),
        ),
      ),

      body: MediaQuery.of(context).size.width < 620 ?
      SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 70,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
             const Spacer(),

              Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      const UserAvatar(size: 150),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
              ),

              const SizedBox(
                height: 35,
              ),

              TextField(
                controller: _firstName,
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

              TextField(
                controller: _lastName,
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

              const SizedBox(
                height: 20,
              ),

              TextField(
                controller: _email,
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

              TextField(
                controller: _location,
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

              const SizedBox(
                height: 20,
              ),

              TextField(
                controller: _phone,
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

              const SizedBox(
                height: 25,
              ),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                ),
              ),

              const Spacer()

            ],
          ),
        ),
      ) :
      const Row(
        children: [
          Text("Desktop"),
        ],
      )
    );
  }
}
