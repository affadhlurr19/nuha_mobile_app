import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:badges/badges.dart';
import 'package:nuha_mobile_app/ui/article_detail_page.dart';
import 'package:nuha_mobile_app/ui/search_article_page.dart';

class ArticleListPage extends StatelessWidget {
  static const String articleTitle = 'Articles';
  const ArticleListPage({super.key});

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
          automaticallyImplyLeading: false,
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
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ArticleDetailPage.routeName);
                  },
                  child: Container(
                    height: 130,
                    child: Row(children: <Widget>[
                      Container(
                        height: 130,
                        width: 125,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://likmi.ac.id/wp-content/uploads/2022/08/15821692445821.jpg"),
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
                                  'Bagaimana cara menjaga keuangan agar tetap sehat',
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
                                    'Perencanaan Keuangan',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum  ada sd asd sada s sadas s dadsa sad asa ads asdsa a aa',
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
            ),
          ],
        ),
      ),
    );
  }
}
