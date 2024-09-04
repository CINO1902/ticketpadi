import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/loginModel.dart';
import '../../../domain/repositories/authRepo.dart';


class authprovider extends ChangeNotifier {
  final AuthRepository authReposity;

  authprovider(this.authReposity);
  bool error = false;

  String message = '';
  File? image;
  bool loading = false;
  bool uploadimageerror = false;
  bool getinfo1 = false;
  String email = '';
  String profilepic = '';
  String firstname = '';
  bool logoutuser = false;
  DateTime dob = DateTime.now();
  bool infoloading = true;
  String lastname = '';
  String address = '';
  String phone = '';
  String imageurl = '';
  String es = '';

  final dio = Dio();
  Future<void> login(email, password) async {
    LoginModel login = LoginModel(email: email, password: password);
    loading = true;
    notifyListeners();

    final response = await authReposity.login(login);
    logoutuser = false;
    if (response[0].contains('1')) {
      print('error is here');
      error = true;
      message = response[1];
    } else {
      error = false;
      message = response[1];
      String token = response[2];
      final pref = await SharedPreferences.getInstance();
      pref.setString('jwt_token', token);
    }
    loading = false;

    notifyListeners();
  }

  Future<void> verifyOtp(otp) async {
    loading = true;
    notifyListeners();

    final response = await authReposity.Verifyemail(otp);
    if (response[0].contains('1')) {
      error = true;
      message = response[1];
    } else {
      error = false;
      message = response[1];
    }
    loading = false;
    notifyListeners();
  }
}
