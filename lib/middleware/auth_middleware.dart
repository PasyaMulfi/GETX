import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Check authentication status
    bool isAuthenticated = _checkAuthentication();

    // Redirect to login page if not authenticated
    if (!isAuthenticated && route != '/login') {
      return RouteSettings(name: '/login');
    }

    return null;
  }

  bool _checkAuthentication() {
    SharedPreferences localStorage;
    String? token;

    Future<void> checkToken() async {
      localStorage = await SharedPreferences.getInstance();
      token = localStorage.getString('token');
    }

    checkToken();

    return token != null;
  }
}
