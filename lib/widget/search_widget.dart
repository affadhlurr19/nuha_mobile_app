import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/data/model/search_article.dart';
import 'package:nuha_mobile_app/ui/article_detail_page.dart';

class SearchWidget extends StatelessWidget {
  final Articles searchResult;

  const SearchWidget({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName,
              arguments: searchResult.id),
          child: SizedBox(
            height: 130,
            child: Row(children: <Widget>[
              Container(
                height: 130,
                width: 125,
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(searchResult.imageUrl!),
                    )),
              ),
              Flexible(
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          searchResult.title!,
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Badge(
                          toAnimate: false,
                          shape: BadgeShape.square,
                          badgeColor: iconColor,
                          borderRadius: BorderRadius.circular(8),
                          badgeContent: Text(
                            searchResult.category!,
                            style: Theme.of(context).textTheme.button!.copyWith(
                                fontSize: 8, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          searchResult.content!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 10),
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
  }
}