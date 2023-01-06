import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';

class MenuProfile extends StatelessWidget {
  final String name;
  final IconData ikon;
  const MenuProfile({Key? key, required this.name, required this.ikon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 18),
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
          Icon(
            ikon,
            color: titleColor,
            size: 20.0,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
