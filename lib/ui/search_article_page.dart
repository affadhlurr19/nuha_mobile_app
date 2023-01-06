import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';

class SearchArticlePage extends StatelessWidget {
  static const String routeName = '/search';

  const SearchArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: titleColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light),
        toolbarHeight:60,
        backgroundColor: titleColor,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Material(
            elevation: 5.0,
            shadowColor: Colors.black26,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white)),
            child: TextField(
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
            ),
          ),
        ),
      ),
    );
  }
}
