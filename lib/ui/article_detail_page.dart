import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';

class ArticleDetailPage extends StatelessWidget {
  static const String routeName = '/detail-page';

  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F9),
      body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light),
          expandedHeight: 250,
          leading: 
            Container(
                padding: const EdgeInsets.only(left: 15),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.black38,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
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
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    iconSize: 25,
                    color: iconColor,
                    onPressed: () {
                      // TO DO
                    },
                  ),
                )),
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
                'https://likmi.ac.id/wp-content/uploads/2022/08/15821692445821.jpg',
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
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Text('Bagaimana cara menjaga keuangan agar tetap sehat',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 26,fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        size: 24,
                        color: secondaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text('6 Januari 2023, 21:10:21',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12)),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.category,
                        size: 24,
                        color: secondaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text('Perencanaan Keuangan',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12)),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 24,
                        color: secondaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text('5 Min',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12)),
                      )
                    ],
                  ),
                ),              
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Text(
                      'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to havevLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to haveLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Text('Author',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 18,fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 7, left: 10, right: 10, bottom: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                        radius: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('Kevin Barron',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith( color: Colors.black, fontSize: 14)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        )
      ],
    ),
    );
  }
}
