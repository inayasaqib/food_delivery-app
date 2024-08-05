import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_delivery/ui/core/serviceapi/api.dart';
import 'package:food_delivery/ui/models/user/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final Api _api = Api();

  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      Response response = await _api.sendRequest.post(
        "/user/register",
        data: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
        }),
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
      return UserModel.fromJson(apiResponse.data);
    } catch (e) {
      // Log or handle specific exceptions if needed
      throw Exception("Registration failed: $e");
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // try {
      // Response response = await _api.sendRequest.post(
      //   "/users/login",  // Ensure this is the correct endpoint for login
      //   data: jsonEncode({
      //     "email": email,
      //     "password": password,
      //   }),
      //   options: Options(
      //     headers: {"Content-Type": "application/json"},
      //   ),
      // );
      // ApiResponse apiResponse = ApiResponse.fromResponse(response);
      //       if (!apiResponse.success) {
      //   throw Exception(apiResponse.message);
      // }
      // return UserModel.fromJson(apiResponse.data);
      var url = Uri.parse(BASE_URL + "/users/login");

      // Await the http get response, then decode the json-formatted response.
      var apiResponse = await http.post(
        url,
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("sddddd${apiResponse}");
      return UserModel.fromJson(jsonDecode(apiResponse.body));
    // } catch (e) {
    //   // Log or handle specific exceptions if needed
    //   throw Exception("Login failed: $e");
    // }
  }

  Future<UserModel> updateUser(UserModel userModel) async {
    try {
      Response response = await _api.sendRequest.put(
        "/user/update/${userModel.sId}", // Adjust endpoint as necessary
        data: jsonEncode(userModel.toJson()),
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
      return UserModel.fromJson(apiResponse.data);
    } catch (e) {
      throw Exception("Update user failed: $e");
    }
  }
}
