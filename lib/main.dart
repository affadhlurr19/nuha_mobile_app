import 'package:flutter/material.dart';
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
      routes: {
        '/': (context) => SplashPage(),
        '/hello': (context) => HelloPage(),
      },
      // initialRoute: HomePage.routeName,
      // routes: {
      //   HomePage.routeName: (context) => const HomePage(),
      //   DetailPage.routeName: (context) => DetailPage(
      //         idRestaurant:
      //             ModalRoute.of(context)?.settings.arguments as String,
      //       ),
      //   SearchPage.routeName: (context) => const SearchPage(),
      // },
    );
  }
}
