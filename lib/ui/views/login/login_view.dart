import 'package:flutter/material.dart';
import 'package:food_delivery/ui/views/login/login_viewmodel.dart';
import 'package:food_delivery/ui/views/login/textfield.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewmodel>.reactive(
      viewModelBuilder: () => LoginViewmodel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(gradient: viewmodel.gradient),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Image(image: AssetImage("assets/images/logo.png")),
                      ),
                      Container(
                        height: 398,
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color(0xff1D102D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            MyTextField(
                              hintText: 'Email',
                              controller: viewmodel.emailController,
                              prefixIcon: Icons.email_rounded,
                              focusNode: viewmodel.focusNode1,
                            ),
                            const SizedBox(height: 10),
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
                                  viewmodel.loginAndNavigate(
                                    email: viewmodel.emailController.text.trim(),
                                    password: viewmodel.passwordController.text.trim(),
                                    context: context,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(97, 48, 0, 192),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: viewmodel.isLoading
                                    ? CircularProgressIndicator()
                                    : const Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 110.0, vertical: 10),
                              child: Row(
                                children: [
                                  Image(image: AssetImage("assets/images/fbgoogle.png")),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          viewmodel.nav();
                        },
                        child: const Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
