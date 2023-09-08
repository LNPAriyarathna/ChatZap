import 'package:firebase_chat_app/pages/sign_in/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            Container(
              width: 76.w,
              height: 76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 76.w,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        // boxShadow: [Shadows.primaryshadow]
                        borderRadius: BorderRadius.all(Radius.circular(35))),
                  )),
                  Positioned(
                      child: Image.asset("assets/images/2.jpg",
                          width: 76.w, height: 76.w, fit: BoxFit.cover))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
              child: Text(
                "Let's chat",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp),
              ),
            )
          ],
        ),
      );
    }

    Widget _buildThirdPartyLogin() {
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(bottom: 280.h),
        child: Column(
          children: [
            Text("Sign in with social networks",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp)),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
              child: ElevatedButton(
                onPressed: () {
                  SignInController().handleSignIn(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200.w, 55.h),
                ),
                child: Text(
                  "Google Login",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        body: Center(
      child: Column(
        children: [_buildLogo(), const Spacer(), _buildThirdPartyLogin()],
      ),
    ));
  }
}
