import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/widget/menu_profile_widget.dart';

class ProfilePage extends StatefulWidget {
  static const String profileTitle = 'Profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  late User? _activeUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      _activeUser = _auth.currentUser;
    } catch (e) {
      print(e);
    }
  }

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
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile',
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
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor,
                      ),
                      child: Column(
                        children: [
                          Text(
                            _activeUser!.email.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          SizedBox(
                            width: 65,
                            height: 25,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: iconColor),
                              child: Text(
                                'Free',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Center(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile_picture.jpg"),
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
                      margin: const EdgeInsets.only(top: 28, bottom: 20),
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          final navigator = Navigator.of(context);
                          await _auth.signOut();

                          navigator.pop();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: iconColor),
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
