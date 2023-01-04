import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  static const String articleTitle = 'Articles';
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XFFF7F8F9),
      body: Center(
        child: Text('Ini Halaman Article'),
      ),
    );
  }
}