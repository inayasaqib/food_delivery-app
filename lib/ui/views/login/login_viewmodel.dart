import 'package:flutter/material.dart';
import 'package:food_delivery/app/app.locator.dart';
import 'package:food_delivery/app/app.router.dart';
import 'package:food_delivery/ui/models/repositeries/user_repository.dart';
import 'package:food_delivery/ui/models/user/user_model.dart';
import 'package:food_delivery/ui/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewmodel extends BaseViewModel {
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
  navigationservice.navigateToSignup();
}
navs(){
  navigationservice.navigateToHomeview();
}
 final UserRepository _userRepository = UserRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = "";
  String get er => _error;

 UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<void> loginAndNavigate({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);
    try {
      UserModel userModel = await _userRepository.login(email: email, password: password);
      _userModel = userModel;
      await Preferences.saveUserDetails(email, password);
      notifyListeners();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Homeview())); // Navigate to HomeView
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _emitLoggedInState({
    required UserModel userModel,
    required String email,
    required String password,
  }) async {
    await Preferences.saveUserDetails(email, password);
    _userModel = userModel;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }
}

class Preferences {
  static Future<void> saveUserDetails(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);
  }

  static Future<Map<String, String?>> fetchUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('user_email');
    final String? password = prefs.getString('user_password');
    return {'email': email, 'password': password};
  }

  static Future<void> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email');
    await prefs.remove('user_password');
  }
}