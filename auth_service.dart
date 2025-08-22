import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class AuthService{
  final LocalAuthentication localAuthentication = LocalAuthentication();
  Future<bool>  authenticateLocally() async{
    bool isAuthenticate=false;
    try{
      isAuthenticate=await localAuthentication.authenticate(
          localizedReason: "We need to authenticate first.",
          options: AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs:true
          )
      );
    }on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        ScaffoldMessenger(
          child: SnackBar(content: Text("No biometric available")),
        );
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        // ...
      } else {

      }
    }
    catch(e){
    isAuthenticate=false;
    }
    return isAuthenticate;
  }
}