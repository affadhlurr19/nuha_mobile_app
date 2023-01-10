import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:nuha_mobile_app/ui/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 26),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Let's sign you up",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: titleColor),
                ),
              ),
              const SizedBox(height: 1),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Welcome, \nYou have been waiting for",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 57),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 7),
                child: Text(
                  'Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: secondaryColor, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: secondaryColor, width: 1.5)),
                      isDense: true,
                      hintText: 'Your Email Address'),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 7),
                child: Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: secondaryColor,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: secondaryColor, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: secondaryColor, width: 1.5)),
                      isDense: true,
                      hintText: 'Your Password'),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 7),
                child: Text(
                  'Password Confirmation',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: _confirmPasswordController,
                  obscureText: _obscureTextConfirm,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: secondaryColor,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirm = !_obscureTextConfirm;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: secondaryColor, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: secondaryColor, width: 1.5)),
                      isDense: true,
                      hintText: 'Your Password Confirmation'),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 108),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Log In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                          },
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: iconColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        final navigator = Navigator.of(context);
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final confirmPassword = _confirmPasswordController.text;

                        if (password != confirmPassword) {
                          const snackbar = SnackBar(
                              content:
                                  Text('Password Confirmation Do Not Match'));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        } else {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);

                          navigator.pushReplacementNamed(LoginPage.routeName);
                          const snackbar = SnackBar(
                              content: Text('Your Account is Created'));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          const snackbar = SnackBar(
                              content: Text(
                                  'The Password is too weak. Min 6 Character'));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        } else if (e.code == 'email-already-in-use') {
                          const snackbar = SnackBar(
                              content: Text(
                                  'The account already exists for that email.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                      } catch (e) {
                        final snackbar = SnackBar(content: Text(e.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
