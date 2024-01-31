import 'package:ecommerce/common/custom_button.dart';
import 'package:ecommerce/common/custom_textfield.dart';
import 'package:ecommerce/features/auth/screens/auth_sign_in.dart';
import 'package:ecommerce/features/auth/service/service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthSignup extends StatefulWidget {
  const AuthSignup({super.key});

  @override
  State<AuthSignup> createState() => _AuthSignupState();
}

class _AuthSignupState extends State<AuthSignup> {
 final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool obscure = false;
  final Service _service = Service();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void signupUser() {
    _service.signup(
        context: context,
        name: nameController.text,
        email: emailController.text,
        password: passController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Fashion\n',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            children: [
                              TextSpan(
                                  text: 'My Life My Style',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15))
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: 'Sign Up\n',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              children: [
                                TextSpan(
                                    text: 'Create new account',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 204, 199, 199),
                                        fontSize: 15))
                              ])),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        text: 'name',
                        controller: nameController,
                       
                        keyboardType: TextInputType.name),
                    CustomTextField(
                        text: 'email',
                        controller: emailController,
                        
                        keyboardType: TextInputType.emailAddress),
                    CustomTextField(
                        sufficIcon: Icon(
                            obscure ? Icons.visibility : Icons.visibility_off),
                        obscure: obscure,
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        text: '*******',
                        controller: passController,
                       
                        keyboardType: TextInputType.visiblePassword),
                    Center(
                      child: CustomButton(
                          text: 'sign up',
                          onTap: () {
                            if (key.currentState!.validate()) {
                              signupUser();
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: 'already have an account? ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AuthSignIn())),
                                text: 'Login',
                                style: const TextStyle(color: Colors.blue))
                          ])),
                    )
                  ]),
            )));
  }
}
