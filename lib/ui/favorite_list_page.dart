import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/data/model/detail_article.dart';
import 'package:nuha_mobile_app/provider/database_provider.dart';
import 'package:nuha_mobile_app/ui/article_detail_page.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  static const String routeName = '/my-favorite';
  const FavoriteList({super.key});

  get backColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: titleColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: titleColor,
        title: Text('My Favorite List',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white)),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: provider.favArticles.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, provider.favArticles[index]);
            },
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.do_not_disturb_outlined,
                  size: 75,
                  color: Colors.black12,
                ),
                const SizedBox(height: 7),
                Text(
                  'Tidak ada daftar favorite',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildArticleItem(BuildContext context, Article detailArticle) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(detailArticle.id!),
          builder: (context, snapshot) {
            var isFavorited = snapshot.data ?? false;
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName, arguments: detailArticle.id),
                  child: SizedBox(
                    height: 120,
                    child: Row(children: <Widget>[
                      Container(
                        height: 120,
                        width: 125,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(detailArticle.imageUrl!),
                            )),
                      ),
                      Flexible(
                        child: IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  detailArticle.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Badge(
                                  toAnimate: false,
                                  shape: BadgeShape.square,
                                  badgeColor: iconColor,
                                  borderRadius: BorderRadius.circular(8),
                                  badgeContent: Text(
                                    detailArticle.category!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 0),
                                alignment: Alignment.bottomRight,
                                child: isFavorited
                                    ? IconButton(
                                        icon: const Icon(Icons.favorite),
                                        color: iconColor,
                                        onPressed: () =>
                                            provider.removeFavArticles(
                                                detailArticle.id!),
                                      )
                                    : IconButton(
                                        icon: const Icon(Icons.favorite_border),
                                        color: primaryColor,
                                        onPressed: () => provider
                                            .addFavArticles(detailArticle),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
