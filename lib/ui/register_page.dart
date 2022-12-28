import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
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
              const SizedBox(height: 47),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 7),
                child: Text(
                  'Full Name',
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
                  keyboardType: TextInputType.name,
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
                      hintText: 'Your Full Name'),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 14),
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
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                        color: secondaryColor,
                        size: 24,
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
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                        color: secondaryColor,
                        size: 24,
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
              const SizedBox(height: 58),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.bodySmall,
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Log In',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: primaryColor),
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: primaryColor,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
