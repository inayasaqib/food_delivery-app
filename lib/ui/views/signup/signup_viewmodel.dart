import 'package:flutter/material.dart';
import 'package:food_delivery/app/app.locator.dart';
import 'package:food_delivery/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewmodel extends BaseViewModel {
  final navigationservice = locator<NavigationService>();
   final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final  focusNode1 = FocusNode();
  final  focusNode2 = FocusNode();
  LinearGradient gradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
        Color.fromARGB(255, 19, 6, 110),
    Color.fromARGB(255, 2, 0, 6),
  ],
);
nav(){
  navigationservice.navigateToLoginView();
}
navs(){
  navigationservice.navigateToHomeview();
}
}