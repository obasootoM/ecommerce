import 'package:ecommerce/common/custom_button.dart';
import 'package:ecommerce/common/custom_textfield.dart';
import 'package:ecommerce/features/auth/screens/auth_sign_up.dart';
import 'package:ecommerce/features/auth/service/service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthSignIn extends StatefulWidget {
  const AuthSignIn({super.key});

  @override
  State<AuthSignIn> createState() => _AuthSignInState();
}

class _AuthSignInState extends State<AuthSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final key = GlobalKey<FormState>();
  final service = Service();

  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void signIn() {
    service.signin(
        context: context,
        email: emailController.text,
        password: passController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: 'Fashion\n',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: [
                    TextSpan(
                        text: 'My Life My Style',
                        style: TextStyle(color: Colors.black, fontSize: 15))
                  ])),
          const SizedBox(
            height: 50,
          ),
          RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                  text: 'Welcome!\n',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: [
                    TextSpan(
                        text: 'Please Login or sign up to continue our app',
                        style: TextStyle(
                            color: Color.fromARGB(255, 199, 197, 197),
                            fontSize: 15))
                  ])),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            text: 'email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextField(
            text: '*******',
            obscure: true,
            controller: passController,
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Login',
            onTap: () {
              if (key.currentState!.validate()) {
                signIn();
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: 'don\'t have an account? ',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthSignup())),
                    text: 'Sign up',
                    style: const TextStyle(color: Colors.blue))
              ]))
        ]),
      ),
    );
  }
}
