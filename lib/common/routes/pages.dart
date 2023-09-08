import 'package:firebase_chat_app/common/routes/names.dart';
import 'package:firebase_chat_app/pages/welcome/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import '../../pages/sign_in/bindings.dart';
import '../../pages/sign_in/view.dart';
import '../../pages/welcome/bindings.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APPlication = AppRoutes.Application;

  //static final RouteObserver<Route> observer = RouteObservers();

  static RouteObserver<Route> RouteObservers() {
    // Implementation of the RouteObservers method
    // Return an instance of RouteObserver<Route>
    return RouteObserver<Route>();
  }

  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      //  middlewares: RouteWelcomeMiddleware(Priority:1),
    ),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => const SignInPage(),
        binding: SignInBinding()),
  ];
}
