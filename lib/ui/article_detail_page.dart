import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:intl/intl.dart';
import 'package:nuha_mobile_app/data/api/api_service.dart';
import 'package:nuha_mobile_app/provider/detail_article_provider.dart';
import 'package:nuha_mobile_app/widget/detail_article_widget.dart';
import 'package:provider/provider.dart';

class ArticleDetailPage extends StatelessWidget {
  static const String routeName = '/detail-page';

  final int idArticle;

  const ArticleDetailPage({super.key, required this.idArticle});

  String formatDatetime(String datetime) {
    var date = DateTime.parse(datetime);
    var formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: ChangeNotifierProvider<DetailArticleProvider>(
        create: (context) => DetailArticleProvider(
            apiService: ApiService(), idArticle: idArticle),
        child: Consumer<DetailArticleProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(
                  child: CircularProgressIndicator(color: titleColor));
            } else if (state.state == ResultState.hasData) {
              var detailArticle = state.result.article;
              return DetailArticleWidget(detailArticle: detailArticle!);
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
          },
        ),
      ),
    );
  }
}
