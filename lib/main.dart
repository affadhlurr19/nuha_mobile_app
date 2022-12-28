import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/ui/hello_page.dart';
import 'package:nuha_mobile_app/ui/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                onPrimary: Colors.white,
                secondary: secondaryColor,
              ),
          textTheme: myTextTheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.black,
            textStyle: const TextStyle(),
          )),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),        
        // initialRoute: HomePage.routeName,
        routes: {
          '/': (context) => SplashPage(),
          '/hello': (context) => HelloPage(),
        },        
    );
  }
}