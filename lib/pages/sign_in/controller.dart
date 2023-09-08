// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_chat_app/common/routes/names.dart';
// import 'package:firebase_chat_app/pages/sign_in/state.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../../common/entities/user.dart';
// import '../../common/store/user.dart';
// import 'index.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

// class SignInController extends GetxController {
//   final state = SignInState();
//   SignInController();
//   final db = FirebaseFirestore.instance;
//   handleSignIn() {
//     Future<void> handlesignIn() async {
//       try {
//         var user = await _googleSignIn.signIn();
//         if (user != null) {
//           String displayName = user.displayName ?? user.email;
//           String email = user.email;
//           String id = user.id;
//           String photoUrl = user.photoUrl ?? "";
//           UserLoginResponseEntity userProfile = UserLoginResponseEntity();
//           userProfile.email = email;
//           userProfile.accessToken = id;
//           userProfile.displayName = displayName;
//           userProfile.photoUrl = photoUrl;

//           UserStore.to.saveProfile(userProfile);
//         }
//       } catch (e) {}
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> handleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          String displayName = user.displayName ?? user.email ?? '';
          String email = user.email ?? '';
          String id = user.uid;
          String photoUrl = user.photoURL ?? '';

          //Save user profile or perform other actions

          // UserLoginResponseEntity userProfile = UserLoginResponseEntity();
          // userProfile.email = email;
          // userProfile.accessToken = id;
          // userProfile.displayName = displayName;
          // userProfile.photoUrl = photoUrl;

          // UserStore.to.saveProfile(userProfile);

          // Navigate to next screen or perform other actions
          // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
        }
      }
    } catch (e) {
      // Handle error
      print('Sign-in error: $e');
    }
  }
}
