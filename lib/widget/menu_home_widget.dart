import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';

class MenuHome extends StatelessWidget {
  final String name;
  final IconData ikon;
  const MenuHome({Key? key, required this.name, required this.ikon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: 150,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(1, 0),
            )
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black),
              maxLines: 2,
            ),
          ),
          Icon(
            ikon,
            color: titleColor,
            size: 20.0,
          )
        ],
      ),
    );
  }
}
