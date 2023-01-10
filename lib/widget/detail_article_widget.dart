import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/data/model/detail_article.dart';
import 'package:nuha_mobile_app/provider/database_provider.dart';
import 'package:provider/provider.dart';

class DetailArticleWidget extends StatelessWidget {
  final Article detailArticle;

  const DetailArticleWidget({super.key, required this.detailArticle});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(detailArticle.id!),
          builder: (context, snapshot) {
            var isFavorited = snapshot.data ?? false;
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.light),
                  expandedHeight: 250,
                  leading: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.black38,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 25,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )),
                  actions: [
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: titleColor,
                          shape: CircleBorder(),
                        ),
                        child: isFavorited
                            ? IconButton(
                                icon: Icon(Icons.favorite),
                                iconSize: 25,
                                color: iconColor,
                                onPressed: () => provider.removeFavArticles(detailArticle.id!),
                              )
                            : IconButton(
                                icon: Icon(Icons.favorite_border),
                                iconSize: 25,
                                color: iconColor,
                                onPressed: () => provider.addFavArticles(detailArticle),
                              ),
                      ),
                    ),
                  ],
                  pinned: true,
                  backgroundColor: titleColor,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.network(
                        detailArticle.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: Text(detailArticle.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 7, left: 10, right: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.date_range,
                                size: 24,
                                color: secondaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(detailArticle.createdAt.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 7, left: 10, right: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.category,
                                size: 24,
                                color: secondaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(detailArticle.category!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 7, left: 10, right: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                size: 24,
                                color: secondaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text('${detailArticle.readTime} Min',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          child: Text(detailArticle.content!,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.justify),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: Text('Author',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              top: 7, left: 10, right: 10, bottom: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                                radius: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(detailArticle.author!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Colors.black, fontSize: 14)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                )
              ],
            );
          },
        );
      },
    );
  }
}
