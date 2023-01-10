import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/provider/search_article_provider.dart';
import 'package:nuha_mobile_app/widget/search_widget.dart';
import 'package:provider/provider.dart';

class SearchArticlePage extends StatefulWidget {
  static const String routeName = '/search';

  const SearchArticlePage({super.key});

  @override
  State<SearchArticlePage> createState() => _SearchArticlePageState();
}

class _SearchArticlePageState extends State<SearchArticlePage> {
  late TextEditingController textEditingController;

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  void initState() {
    super.initState();

    final SearchArticleProvider searchArticleProvider =
        Provider.of<SearchArticleProvider>(context, listen: false);
    textEditingController =
        TextEditingController(text: searchArticleProvider.keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: titleColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light),
        toolbarHeight: 60,
        backgroundColor: titleColor,
        title: Consumer<SearchArticleProvider>(
          builder: (context, state, _) =>  TextField(
                controller: textEditingController,
                cursorColor: Colors.black,
                autofocus: true,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: secondaryColor,
                    size: 25,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Article Here',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black38),
                ),
                onChanged: (value) {
                Provider.of<SearchArticleProvider>(context, listen: false)
                    .search(value);
              },
              ),
            ),
          ),
        
      
      body: Consumer<SearchArticleProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: titleColor,),
                  const SizedBox(height: 7),
                  Text(
                    'Mencari artikel',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            );
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: state.result.founded,
              itemBuilder: (context, index) {
                final searchResult = state.result.article![index];
                return SearchWidget(searchResult: searchResult!);
              },
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.remove_circle_outline_outlined,
                    size: 75,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Artikel tidak ada',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.manage_search,
                    size: 75,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
