// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../auth/firebase_auth/google_auth.dart';

import '../../backend/api_requests/api_calls.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<dynamic> gmailLogin(BuildContext context) async {
  final _googleSignIn = GoogleSignIn(
    clientId:
        "644743379954-6re3mqnj3pooedshtt45r30pk8sjvglb.apps.googleusercontent.com",
  );
  var userData = null;
  final signInFunc = () async {
    try {
      /*if (kIsWeb) {
        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
      }*/

      await signOutWithGoogle().catchError((_) => null);
      userData = await _googleSignIn.signIn();
      dynamic userAccessInfo = await SignupGroup
          .googleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall
          .call(
        email: userData?.email.toLowerCase(),
        name: userData?.displayName,
        picture: userData?.photoUrl,
      );
      FFAppState().userIdInt =
          getJsonField((userAccessInfo?.jsonBody ?? ''), r'''$.id''');
      FFAppState().subjectToken =
          getJsonField((userAccessInfo?.jsonBody ?? ''), r'''$.token''');

      var authTokens = await userData.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: authTokens?.idToken, accessToken: authTokens?.accessToken);
      return FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // The idea is to have a fallback login on debug mode as that would allow testing the app which is currently
      // failing due to javascript origin mismatch for google sign in
      print(e);
      if (kDebugMode) {
        final auth =
            await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());

        userData = auth;

        dynamic userAccessInfo = await SignupGroup
            .googleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall
            .call(
          email: auth.user?.email?.toLowerCase(),
          name: auth.user?.displayName,
          picture: auth.user?.photoURL,
        );

        FFAppState().userIdInt =
            getJsonField((userAccessInfo?.jsonBody ?? ''), r'''$.id''');
        FFAppState().subjectToken =
            getJsonField((userAccessInfo?.jsonBody ?? ''), r'''$.token''');
        return auth;
      }
    }
  };

  await signInFunc();

  dynamic userJson = {
    "email": userData?.email,
    "profile": userData?.photoUrl,
    "name": userData?.displayName,
    "accessToken":
        userData?.serverAuthCode == null ? "" : userData?.serverAuthCode,
  };

  return userJson;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
