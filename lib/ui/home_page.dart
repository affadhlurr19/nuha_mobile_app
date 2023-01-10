import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/widget/carousel_home_widget.dart';
import 'package:nuha_mobile_app/widget/menu_home_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: backColor,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
          toolbarHeight: 0,
          backgroundColor: backColor,
          elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo User!",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: titleColor),
                ),
                Text(
                  "Mari kelola keuanganmu!",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: const Color.fromARGB(132, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 17,
                ),
                const CarouselHome(),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: MenuHome(
                            name: "Finansial Check Up",
                            ikon: Icons.legend_toggle_rounded)),
                    SizedBox(width: 10),
                    Expanded(
                        child: MenuHome(
                            name: "Catat Aset",
                            ikon: Icons.location_city_outlined)),
                  ],
                ),
                const SizedBox(
                  height: 19,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 162,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaksi Bulan Ini",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "Kamu telah mencapai 50% dari anggaran",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 20,
                            width: 310,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 155,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0)),
                              color: secondaryColor,
                            ),
                          ),
                          Center(
                            child: Text(
                              "450.000/900.000",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                      ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: iconColor,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.solidPlusSquare,
                                size: 37,
                                color: titleColor,
                              ),
                              Text(
                                "Pemasukan",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.solidMinusSquare,
                                size: 37,
                                color: titleColor,
                              ),
                              Text(
                                "Pengeluaran",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 182,
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
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 186,
                              height: 120,
                              child: Column(
                                children: [
                                  Text(
                                    "Konsultasikan Keuangan Anda!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    "Lakukan konsultasi melalui video call atau chat dengan mudah dan gratis untuk konsultasi pertama Anda bersama konsultan terpercaya kami.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            color: Colors.black, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const Image(
                              image: AssetImage("assets/images/7000961.jpg"),
                              width: 100,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 280,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: iconColor,
                        ),
                        child: Center(
                          child: Text(
                            "Konsultasi Sekarang",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: MenuHome(
                            name: "Zakat, Infaq, Shodaqoh",
                            ikon: Icons.handshake)),
                    SizedBox(width: 10),
                    Expanded(
                        child: MenuHome(
                            name: "Platform Check",
                            ikon: Icons.checklist_rounded)),
                  ],
                ),
              ],
            )),
      )),
    );
  }
}
