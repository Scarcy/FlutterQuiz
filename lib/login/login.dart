import 'package:flutter/material.dart';
import 'package:fireshipCourse/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Flexible(
              child: LoginButton(
                icon: FontAwesomeIcons.userNinja,
                color: Colors.deepPurple,
                text: 'Continue as Guest',
                loginMethod: AuthService().anonLogin,
              ),
            ),
            LoginButton(
              icon: FontAwesomeIcons.google,
              color: Colors.blue,
              text: 'Sign in with Google',
              loginMethod: AuthService().googleLogin,
            ),
            /* Need to be a part of Apple Developer Program
            LoginButton(
              icon: FontAwesomeIcons.apple,
              color: Colors.black,
              text: 'Sign in with Apple',
              loginMethod: AuthService().signInWithApple,
            )*/
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.text,
      required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text),
      ),
    );
  }
}
