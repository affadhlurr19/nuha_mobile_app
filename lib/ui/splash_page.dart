import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/ui/hello_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, HelloPage.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: titleColor,
      appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: titleColor,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.light),
            toolbarHeight: 0,
            backgroundColor: Colors.white,
            elevation: 0),
      body: Center(
        child: Text(
          'Nuha',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
