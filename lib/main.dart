import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/data/api/api_service.dart';
import 'package:nuha_mobile_app/data/db/database_helper.dart';
import 'package:nuha_mobile_app/provider/article_provider.dart';
import 'package:nuha_mobile_app/provider/database_provider.dart';
import 'package:nuha_mobile_app/provider/search_article_provider.dart';
import 'package:nuha_mobile_app/ui/article_detail_page.dart';
import 'package:nuha_mobile_app/ui/favorite_list_page.dart';
import 'package:nuha_mobile_app/ui/hello_page.dart';
import 'package:nuha_mobile_app/ui/search_article_page.dart';
import 'package:nuha_mobile_app/ui/login_page.dart';
import 'package:nuha_mobile_app/ui/register_page.dart';
import 'package:nuha_mobile_app/ui/splash_page.dart';
import 'package:nuha_mobile_app/widget/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticleProvider>(
            create: (_) => ArticleProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchArticleProvider(apiService: ApiService()),
          child: const SearchArticlePage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nuha Mobile App',
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
        // initialRoute: BottomNav.routeName,
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          HelloPage.routeName: (context) => const HelloPage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          FavoriteList.routeName:(context) => const FavoriteList(),
          BottomNav.routeName: (context) => const BottomNav(),
          ArticleDetailPage.routeName: (context) => ArticleDetailPage(idArticle: ModalRoute.of(context)?.settings.arguments as int),
          SearchArticlePage.routeName: (context) => const SearchArticlePage()
        },
      ),
    );
  }
}
