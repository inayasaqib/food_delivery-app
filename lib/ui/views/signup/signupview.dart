import 'package:flutter/material.dart';
import 'package:food_delivery/ui/views/login/textfield.dart';
import 'package:food_delivery/ui/views/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignupViewmodel(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: viewmodel.gradient
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Image(
                              image: AssetImage("assets/images/logo.png")),
                        ),
                        Container(
                          height: 398,
                          width: 300,
                          decoration: BoxDecoration(
                              color: const Color(0xff1D102D),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              const Text(
                                "Signup",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MyTextField(
                                  hintText: 'Email',
                                  controller: viewmodel.emailController,
                                  prefixIcon: Icons.email_rounded,
                                  focusNode: viewmodel.focusNode1),
                              const SizedBox(
                                height: 10,
                              ),
                              MyTextField(
                                hintText: "Password",
                                controller: viewmodel.passwordController,
                                prefixIcon: Icons.lock,
                                focusNode: viewmodel.focusNode2,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 40,
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    viewmodel.navs();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(97, 48, 0, 192),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Center(
                                    child:  Text(
                                      "Create Account",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 110.0, vertical: 10),
                                child: Row(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/fbgoogle.png"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Already Have aAn Account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            viewmodel.nav();
                          },
                          child: const Text(
                            "Signup",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
