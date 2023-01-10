import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/widget/card_article.dart';
import 'package:provider/provider.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/provider/article_provider.dart';
import 'package:nuha_mobile_app/ui/search_article_page.dart';

class ArticleListPage extends StatelessWidget {
  static const String articleTitle = 'Articles';
  const ArticleListPage({super.key});

  Widget _buildList() {
    return Consumer<ArticleProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(
          child: CircularProgressIndicator(color: titleColor),
        );
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.result.article!.length,
          itemBuilder: (context, index) {
            var article = state.result.article![index];
            return CardArticle(article: article);
          },
        );
      } else if (state.state == ResultState.noData) {
        return Center(
          child: Material(
            child: Text(state.message),
          ),
        );
      } else if (state.state == ResultState.error) {
        return Center(
          child: Material(
            child: Text(state.message),
          ),
        );
      } else {
        return const Center(
          child: Material(
            child: Text(''),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: backColor,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
          toolbarHeight: 80,
          backgroundColor: backColor,
          actions: [
            Container(
                padding: const EdgeInsets.only(right: 15),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: titleColor,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, SearchArticlePage.routeName);
                    },
                  ),
                )),
          ],
          title: Text(
            'Article',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: titleColor),
          ),
          elevation: 0),
      backgroundColor: backColor,
      body: SingleChildScrollView(
        child: Column(
          children: [const SizedBox(height: 15), _buildList()],
        ),
      ),
    );
  }
}
