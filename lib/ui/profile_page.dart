import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/widget/menu_profile_widget.dart';

class ProfilePage extends StatelessWidget {
  static const String profileTitle = 'Profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: titleColor),
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.only(top: 50),
                      width: 330,
                      height: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "James Supratno",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "jamessupratno@gmail.com",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            width: 58,
                            height: 22,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Free',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: iconColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Center(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("images/profile_picture.jpg"),
                        radius: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Column(
                  children: const [
                    MenuProfile(name: "Favorite Artikel", ikon: Icons.favorite),
                    MenuProfile(name: "Upgrade Akun", ikon: Icons.diamond),
                    MenuProfile(
                        name: "Kode Referral", ikon: Icons.wallet_giftcard),
                    MenuProfile(
                        name: "Invoice", ikon: Icons.description_rounded),
                    MenuProfile(name: "Bantuan", ikon: Icons.help),
                    MenuProfile(name: "Kontak Kami", ikon: Icons.chat_rounded),
                    MenuProfile(
                        name: "Syarat & Ketentuan", ikon: Icons.error_rounded),
                    MenuProfile(
                        name: "Kebijakan Privasi",
                        ikon: Icons.security_rounded),
                  ],
                ),
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/hello');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Log Out',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.black,
                              size: 14.0,
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: iconColor),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
