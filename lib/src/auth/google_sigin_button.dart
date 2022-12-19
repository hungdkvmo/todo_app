import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/src/utils/authentication.dart';
import 'package:todo_app/src/widgets/user/user_info.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  GoogleSignInButtonState createState() {
    return GoogleSignInButtonState();
  }
}

class GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        height: 48,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(
                color: Color(0XFF8875FF),
                width: 1.0,
              ),
            ),
          ),
          icon: SvgPicture.asset(
            'assets/icons/google.svg',
            width: 24,
            height: 24,
          ), //icon data for elevate
          onPressed: () async {
            // login with google
            setState(() {
              _isSigningIn = true;
            });
            User? user =
                await Authentication.signInWithGoogle(context: context);

            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreen(
                    user: user,
                  ),
                ),
              );
            }

            setState(() {
              _isSigningIn = false;
            });
          },
          label: const Text(
            'Login with Google',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
